class Event < ApplicationRecord
    has_many :participants
    has_many :occurrences
    has_many :users, :through => :participants

    accepts_nested_attributes_for :occurrences, :allow_destroy => true

    scope :upcoming, lambda { Event.includes(:occurrences).where('occurrences.date_time >= ?', DateTime.now).references(:occurrences)}
    scope :completed, lambda { Event.includes(:occurrences).where('date_time < ?', DateTime.now).references(:occurrences)}

    validates_presence_of :title, :location, :description
    validates_numericality_of :points, :only_integer => true
end
