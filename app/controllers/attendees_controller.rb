class AttendeesController < ApplicationController
  before_action :has_occurrence,:authenticate_user!
  protected
  def has_occurrence
    #  unless @current_user
    #      flash[:warning] = "You must be logged in to see participants or participate in an event"
    #      redirect_to events_path(@event)
    #  end
      unless (@occurrence = Occurrence.where(:id => params[:occurrence_id]).first)
          flash[:warning] = "Occurrence must exist to have registrees"
          redirect_to occurrences_path
      end
  end

  def new
    @attendee = Attendee.new
  end

end
