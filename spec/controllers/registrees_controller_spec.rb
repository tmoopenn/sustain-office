require 'rails_helper'

RSpec.describe RegistreesController, type: [:request,:controller] do
    describe "check filter" do
        it "should redirect to events path with flash message when try to call registree controller with an event that does not exist" do
        e = Event.new(:id=>12)
        get event_registrees_path(e)
        expect(flash[:warning]).to match(/Event must exist to have registrees/)
        expect(response).to redirect_to(events_path)
        end
    end

    describe "create" do
        it "should show a flash message on failure to create registree" do

        end
    end
end
