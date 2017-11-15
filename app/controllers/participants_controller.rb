class ParticipantsController < ApplicationController
    before_action :has_event,:authenticate_user!
    protected
    def has_event
      #  unless @current_user 
      #      flash[:warning] = "You must be logged in to see participants or participate in an event"
      #      redirect_to events_path(@event)
      #  end
        unless (@event = Event.where(:id => params[:event_id]).first)
            flash[:warning] = "Event must exist to have participants"
            redirect_to events_path
        end
    
    end
    
    public
    def index
        @participants = @event.participants
        if @participants.empty?
            flash[:notice] = "There are no participants registered for #{@event.title}"
            redirect_to events_path(@event)
        end
    end

    def new
        @participant = @event.participants.build
    end

    def create
       if @event.users.where("user_id = ?",current_user.id).first != nil
            flash[:notice] = "You are already registered for this event"
            redirect_to events_path(@event)
       else
            if current_user.participants << @event.participants.build(params[:participant])
                flash[:notice] = "You are now registered for the event #{@event.title}!"
            else
            flash[:warning] = "Failed to register for #{@event.title}" 
            end
            redirect_to events_path(@event)
        end
    end
end
