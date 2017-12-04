class AttendeesController < ApplicationController
  before_action :has_occurrence,:authenticate_user!
  protected
  def has_occurrence
      unless (@occurrence = Occurrence.where("id =?", params[:occurrence_id]).first)
          flash[:warning] = "Occurrence must exist to have registrees"
          redirect_to occurrences_path
      end
  end
  
  public
  def show
    @event = @occurrence.event
   # @attendee = params[:attendee]
    @attendee = Attendee.where("id = ?", params[:attendee_id]).first
  end
  
  def new
  # byebug
   # @attendee = @occurrence.attendees.build(:user_id => current_user.id)
   @attendee = Attendee.new
  end
    
  def create
    @attendee = @occurrence.attendees.build(create_update_params)
    @attendee.user_id = current_user.id
    if @attendee.save
        flash[:notice] = "Summary created for \'#{@occurrence.event.title}\'"
        redirect_to user_path(current_user)
    else
        flash[:warning] = "Failed to create summary for \'#{@occurrence.event.title}\'"
        redirect_to user_path(current_user) and return
    end
  end

  private
  def create_update_params
    params.require(:attendee).permit(:summary)
  end

end
