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
  
  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  

end
