class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
   
 respond_to :html, :js
      
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml

  def create
    # logger.debug "AJAX CONTROLLER ENTRY ********************"
    #@comment = Comment.new
    # @comment.comment = params[:comment]
    # @comment.user_id = session[:s_user_id]
    # @comment.micropost_id = params[:micropost].to_i
    # logger.debug "AJAX CONTROLLER BEFORE ********************"
    #if @comment.save
      #logger.debug "AJAX CONTROLLER AFTER ********************" 
      
    #end
    #@comment = Comment.new(params[:comment])
    #flash[:notice] = 'Comment was successfully created.' if @comment.save
    #respond_with(@comment, :location => comments_path)
    
  #end
      @comment = Comment.new( params[:comment] )

      flash[:notice] = "Comment successfully created" if @comment.save
      respond_with( @comment, :layout => !request.xhr? )
      
  
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
