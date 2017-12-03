class Attendee < ApplicationRecord
    belongs_to :occurrence, :dependent => :destroy
    belongs_to :user, :dependent => :destroy 

    validates :occurrence_id, :presence => true
    validates :user_id, :presence => true
end
