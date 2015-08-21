class EventsController < ApplicationController
  respond_to :json, :html
  
  skip_before_action :verify_authenticity_token

  def index
    if params[:search].present? 
    	search_condition = "%" + params[:search] + "%"
    	@events = Event.where("events.tags LIKE :query OR organizations.name LIKE :query OR title LIKE :query", query: search_condition).joins(:organization)
    else
    	@events = Event.all
    end
    respond_with @events 
  end

  def create
  	@event = Event.create(event_params)
    respond_with @event, location: events_url
  end

  def destroy
  end

  def update
  end

private

  def event_params
      params.require(:event).permit(:title, :location, :start_time, :end_time, :description, :organization_id)
  end

end
