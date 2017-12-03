class EventsController < ApplicationController
  def index
    @events_recurring = Event.where(recurring: true).upcoming
    @events_nonrecurring = Event.where(recurring: false).upcoming
  end

  def show
    id = params[:id]
    @event = Event.find(id)
  end

  def new
    @event = Event.new
    @event.occurrences.build
  end

  def create
    date_t = DateTime.civil(params[:occurrences]["date_time(1i)"].to_i,
      params[:occurrences]["date_time(2i)"].to_i,
      params[:occurrences]["date_time(3i)"].to_i,
      params[:occurrences]["date_time(4i)"].to_i,
      params[:occurrences]["date_time(5i)"].to_i)
    date_t = date_t.strftime('%a %b %d %H:%M')
    e = Event.new(create_update_params)
    o = Occurrence.new(:date_time => date_t, :event_id => e.id)
    e.occurrences << o
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
    @occurrences = @event.occurrences
  end

  def update
    id = params[:id]
    date_t = DateTime.civil(params[:event][:occurrences_attributes]["0"]["date_time(1i)"].to_i,
      params[:event][:occurrences_attributes]["0"]["date_time(2i)"].to_i,
      params[:event][:occurrences_attributes]["0"]["date_time(3i)"].to_i,
      params[:event][:occurrences_attributes]["0"]["date_time(4i)"].to_i,
      params[:event][:occurrences_attributes]["0"]["date_time(5i)"].to_i)
    e = Event.find(id)
    e.update(create_update_params)
    if e.save
      flash[:notice] = "Event #{e.title} updated"
      redirect_to events_path
    else
      flash[:error] = "Error updating event"
      redirect_to edit_event_path(e)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event #{@event.title} deleted"
    redirect_to events_path
  end

  def about
  end

  def all
    @events_recurring = Event.where(recurring: true)
    @events_nonrecurring = Event.where(recurring: false)
  end


  private
  def create_update_params
    params.require(:event).permit(:title, :location, :recurring, :points, :description, :occurrences_attributes => [:id, :date_time])
  end

end
