class ParticipantsController < ApplicationController
    before_action :has_user_and_event
    protected
    def has_user_and_event
       # unless @current_user 
       #     flash[:warning] = "You must be logged in to see participants or participate in an event"
       #     redirect_to events_path
       # end
        unless (@event = Event.where(:id => params[:event_id]).first)
            flash[:warning] = "Event must exist to have participants"
            redirect_to events_path
        end
    
    end
    
    public
    def index
        @participants = @event.participants
    end

    def new
        @participant = @event.participants.build
    end

    def create
        @current_user.events << @event.participants.build(params[:participant])
    end
end
