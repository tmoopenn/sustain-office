class Event < ApplicationRecord
    has_many :participants
    has_many :occurrences
    has_many :users, :through => :participants

    accepts_nested_attributes_for :occurrences

    scope :upcoming, lambda { Event.joins(:occurrences).where(['occurrences.date_time >= ?', DateTime.now])}
    scope :completed, lambda { Event.joins(:occurrences).where(['occurrences.date_time < ?', DateTime.now])}

    validates_presence_of :title, :location, :description
    validates_numericality_of :points, :only_integer => true
end
