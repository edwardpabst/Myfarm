class MicropostsController < ApplicationController

before_filter :authenticate, :only => [:create, :destroy]
before_filter :authorized_user, :only => :destroy
  
  def new
  
  end
  
  
  def create
    @micropost = @current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      respond_to do |format|
          format.html { redirect_to("/mynetwork") }
      end
    else
      @feed_items = [ ]
      respond_to do |format|
          format.html { redirect_to("/mynetwork") }
      end
    end
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted!"
    respond_to do |format|
        format.html { redirect_to("/mynetwork") }
    end
  end
  
  private
  
    def authorized_user
      @micropost = Micropost.find(params[:id])
      redirect_to root_path unless current_user?(@micropost.user)
    end

end
