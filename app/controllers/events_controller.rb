class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    id = params[:id]
    @event = Event.find(id)
  end

  def new
    @event = Event.new
  end

  def create
    e = Event.new(create_update_params)
    if e.save
      flash[:notice] = "New event \'#{e.title}\' created"
      redirect_to events_path
    else
      flash[:error] = "Error adding event"
      redirect_to new_event_path(e)
    end

  end

  def edit
    id = params[:id]
    @event = Event.find(id)
  end

  def update
    id = params[:id]
    e = Event.find(id)
    e.update(create_update_params)
    if e.save
      flash[:notice] = "Event \"#{e.title}\" updated"
      redirect_to events_path
    else
      flash[:error] = "Error updating rental property"
      redirect_to edit_event_path(e)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event \"#{@event.title}\" deleted"
    redirect_to events_path
  end


  private
  def create_update_params
    params.require(:event).permit(:title, :date_time, :location, :recurring, :description)
  end

end
