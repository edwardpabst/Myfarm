class RelationshipsController < ApplicationController
 before_filter :authenticate
  
  def create
      @user = User.find(params[:relationship] [:followed_id])
      get_current_user.follow!(@user)
      respond_to do |format|
        format.html { redirect_to  @user }
        format.js
      end
  end
  
  
  def destroy
    @user = Relationship.find(params[:id]).followed
    get_current_user.unfollow!(@user)
     respond_to do |format|
        format.html { redirect_to  @user }
        format.js
      end
  end

end
