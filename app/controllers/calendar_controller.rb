class CalendarController < ApplicationController
  before_filter :authenticate
  def index 
      if  !params[:start_date].nil? 
        if !(params[:start_date]).blank?
          @month =  (params[:start_date]).to_date.month.to_i
          @year =  (params[:start_date]).to_date.year.to_i
        else
            @month = (params[:month] || Time.zone.now.month).to_i
            @year = (params[:year] || Time.zone.now.year).to_i
        end
      else 
        @month = (params[:month] || Time.zone.now.month).to_i
        @year = (params[:year] || Time.zone.now.year).to_i
      end

      @shown_month = Date.civil(@year, @month)
      
      @event_strips = Event.event_strips_for_month(@shown_month, :conditions => ['user_id = ?',  session[:s_user_id]])   

      #render '/calendar/index', {:year => @year, :month => @month}
      # To restrict what events are included in the result you can pass additional find options like this:
      #
      # @event_strips = Event.event_strips_for_month(@shown_month, :include => :some_relation, :conditions => 'some_relations.some_column = true')
      #
  end
  
 
 end
