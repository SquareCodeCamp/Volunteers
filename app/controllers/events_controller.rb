class EventsController < ApplicationController
  def index
    @events = Event.all # load all events into instance var
    render json: @events.to_json
  end
end
