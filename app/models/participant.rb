class Participant < ApplicationRecord
    belongs_to :user, :dependent => :destroy
    belongs_to :occurrence, :dependent => :destroy

    validates :event_id, :presence => true
    validates :user_id, :presence => true
end
