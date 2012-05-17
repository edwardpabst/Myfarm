class SubscriptionsController < ApplicationController
  # GET /subscriptions
  # GET /subscriptions.xml
    before_filter :authenticate
  def index
    @subscriptions = Subscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subscriptions }
    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.xml
  def show
    @subscription = Subscription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subscription }
    end
  end

  # GET /subscriptions/new
  # GET /subscriptions/new.xml
  def new
    @subscription = Subscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subscription }
    end
  end

  # GET /subscriptions/1/edit
  def edit
    @subscription = Subscription.find(params[:id])
  end

  # POST /subscriptions
  # POST /subscriptions.xml
  def create
    require "stripe"
    @subscription = Subscription.new(params[:subscription])
    @subscription.user_id = session[:s_user_id]
    @subscription.start_date = Date.today
    @subscription.status = "approved"
    @subscription.card_exp_month = params[:card_exp_month]
    @subscription.card_exp_year = params[:card_exp_year]
    @subscription.stripe_card_token = params[:stripe_card_token]
    @subscription.card_last4 = params[:card_last4]
    
    #logger.debug "PARAMS #{params.inspect}" 

    respond_to do |format|
      if @subscription.save
        process_payment
        format.html { redirect_to(:controller => :users, :action => :edit, :id => session[:s_user_id], :notice => 'Subscription was successfully created.') }
        format.xml  { render :xml => @subscription, :status => :created, :location => @subscription }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subscriptions/1
  # PUT /subscriptions/1.xml
  def update
    @subscription = Subscription.find(params[:id])

    respond_to do |format|
      if @subscription.update_attributes(params[:subscription])
        format.html { redirect_to(@subscription, :notice => 'Subscription was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.xml
  def destroy
    @subscription = Subscription.find_by_user_id(session[:s_user_id])
    @subscription.status = 'cancelled'
    @subscription.save

    respond_to do |format|
      format.html { redirect_to(:controller => :users, :action => :edit, :id => session[:s_user_id], :notice => 'Subscription has been cancelled.') }
      
      format.xml  { head :ok }
    end
  end
  
  def process_payment
    # get the credit card details submitted by the form
    token = @subscription.stripe_card_token
    @user = User.find(@subscription.user_id)

    # your secret key has been set in the Stripe initializer to validate this request
   
    # create a Customer
    customer = Stripe::Customer.create(
      :card => token,
      :description => "Customer set up for user - #{@user.name} id - #{@user.id}"
    )


    # save the customer ID in your database so you can use it later
    User.save_stripe_customer_id(@user.id, customer.id)

    # later
    customer_id = User.get_stripe_customer_id(@user.id)

        
      # charge the Customer instead of the card
        charge = Stripe::Charge.create(
          :amount => 9900, # amount in cents, again
          :currency => "usd",
          :customer => customer_id,
          :description => "subscription charge for user - #{@user.name} id - #{@user.id}"
        )
    
    @subscription = Subscription.find_by_user_id(session[:s_user_id])
    @subscription.status = 'charged'
    @subscription.save
  end
end
