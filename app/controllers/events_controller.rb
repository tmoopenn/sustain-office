# See https://rbudiharso.wordpress.com/2010/07/07/dynamically-add-and-remove-input-field-in-rails-without-javascript/
# for information on dynamically adding and removing DateTime input fields for update and new.


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
    @event = Event.new(create_update_params)
    if params[:add_occurrence]
      #Add empty occurrence associated with @event
      @event.occurrences.build
    elsif params[:remove_occurrence]
      # nested occurrence that have _destroy attribute = 1 will be automatically deleted by rails
    else
      # save like normal
      if @event.save
        flash[:notice] = "New event \'#{@event.title}\' created"
        redirect_to events_path and return
      else
        flash[:error] = "Error adding event"
        redirect_to new_event_path(@event) and return
      end
    end
    render :action => 'new'
  end

  def edit
    id = params[:id]
    @event = Event.find(id)
  end

  def update
    id = params[:id]
    @event = Event.find(id)

    if params[:add_occurrence]
      # rebuild the occurrence attributes that doesn't have an id
    	@event.update(create_update_params)
      # add one more empty occurrence attribute
      @event.occurrences.build
    elsif params[:remove_occurrence]
      # collect all marked for delete occurrence ids
      removed_occurrences = []
      i = 0
      while(1)
        break if params[:event][:occurrences_attributes][i.to_s].nil?
        if params[:event][:occurrences_attributes][i.to_s]["_destroy"] == "1"
          removed_occurrences << params[:event][:occurrences_attributes][i.to_s][:id]
        end
        i = i+1
      end
      Occurrence.delete(removed_occurrences)
      flash[:notice] = "Occurrences removed."
    else
      # save goes like usual
      @event.update(create_update_params)
      if @event.save
        flash[:notice] = "Event #{@event.title} updated"
        redirect_to events_path and return
      else
        flash[:error] = "Error updating event"
        redirect_to edit_event_path(@event) and return
      end
    end
    render :action => 'edit'
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
    params.require(:event).permit(:title, :add_occurrence,
      :remove_occurrence, :location, :recurring, :points, :description,
      :occurrences_attributes => [:id, :date_time, :_destroy])
  end

end
