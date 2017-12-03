class Registree < ApplicationRecord
    belongs_to :user, :dependent => :destroy
    belongs_to :event, :dependent => :destroy

    validates :event_id, :presence => true
    validates :user_id, :presence => true
end
