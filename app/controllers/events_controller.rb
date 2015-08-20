class EventsController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def index
    if params[:search].present? 
    	search_condition = "%" + params[:search] + "%"
    	@events = Event.where("organizations.tag LIKE :query OR organizations.name LIKE :query OR title LIKE :query", query: search_condition).joins(:organization)
    else
    	@events = Event.all
    end
  end

  def create
  	event = Event.create(event_params)
  end

  def destroy
  end

  def update
  end

private

  def event_params
      params.require(:event).permit(:title, :location, :start_time, :end_time, :description)
  end

end
