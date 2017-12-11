require 'rails_helper'

RSpec.describe AttendeesController, type: [:request,:controller] do
    describe "check filter" do
            it "should redirect to occurrences path with flash message when try to call registree controller with an occurrence that does not exist" do
            e = Event.new(:id=>12)
            occ = e.occurrences.build(date_time: "December 14, 2017, 4:30 PM")
            get occurrence_attendees_path(occ,:occurrence_id => 4)
            expect(flash[:error]).to match(/Occurrence must exist to have attendees/)
            expect(response).to redirect_to(occurrences_path)
        end
    end

end
