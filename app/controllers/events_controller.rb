class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    id = params[:id]
    @event = Event.find(id)
  end
end
