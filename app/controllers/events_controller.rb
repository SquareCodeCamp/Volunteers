class EventsController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def index
    @events = Event.all # load all events into instance var
    #render json: @events.to_json
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
