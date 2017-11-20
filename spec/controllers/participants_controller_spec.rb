require 'rails_helper'

RSpec.describe ParticipantsController, type: [:request,:controller] do
    describe "check filter" do
        it "should redirect to events path with flash message when try to call participant controller with an event that does not exist" do
        e = Event.new(:id=>12) 
        get event_participants_path(e)  
        expect(flash[:warning]).to match(/Event must exist to have participants/) 
        expect(response).to redirect_to(events_path)
        end
    end

    describe "create" do
        it "should show a flash message on failure to create participant" do
            
        end
    end
end
