class EventsController < ApplicationController
  
  def update(event)
    
  end
  
  def show
    @event = Event.find(params[:id])
    
    respond_to do |format|
        
        format.html { redirect_to( :controller => "farmjobs" ,  :id => @event.farmjob_id ,  :action => :edit ) }

    end
  end
  
  
  
end
