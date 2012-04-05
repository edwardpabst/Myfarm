class PagesController < ApplicationController
   respond_to  :js
   
  def home
    @title = "Home"
    @onload = "showContent('ifarmservice')"
  
  end
  
  def mynetwork
    @title = "My social network"
    if signed_in?
    
             @micropost = Micropost.new 
             @feed_items = @current_user.feed.paginate(:page => params[:page], :per_page => 12)
    end
  end
  
  def addcomment
     
    @comment = Comment.new
    @comment.comment = params[:comment]
    @comment.micropost_id = params[:micropost]
    @comment.user_id = session[:s_user_id] 
     
    if @comment.save   
          
     # @comments = Comment.get_comments_by_micropost_id(@comment.micropost_id)  
     #logger.debug "ADD NEW COMMENT ********  #{@comments.inspect}"   
      @micropost = Micropost.find(@comment.micropost_id)
      @user = User.find(@micropost.user_id)
      #flash[:notice] = "Comment successfully created"  
                   
      respond_with( @comment, :layout => !request.xhr? )
    end
    
  end
  
  
  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  

end
