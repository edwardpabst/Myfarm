class HomesController < ApplicationController
  
  def validate_status

     if signed_in?
       if user_has_party?     
           redirect_to "/home"
       else
           redirect_to "/parties/new"
       end
     else
       redirect_to "/home"
     end
  end
  
end