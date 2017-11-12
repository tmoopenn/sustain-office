class Event < ApplicationRecord
    has_many :participants
    has_many :users, :through => :participants

    validates_presence_of :title, :location, :date_time, :description
end
