class Event < ApplicationRecord
    has_many :registrees
    has_many :occurrences
    has_many :users, :through => :registrees

    accepts_nested_attributes_for :occurrences, :allow_destroy => true

    scope :upcoming, lambda { Event.includes(:occurrences).where('occurrences.date_time >= ?', DateTime.now).references(:occurrences)}
    scope :completed, lambda { Event.includes(:occurrences).where('date_time < ?', DateTime.now).references(:occurrences)}

    validates_presence_of :title, :location, :description
    validates_numericality_of :points, :only_integer => true

    has_attached_file :image, :styles=> {:medium => "200x200>", :thumb => "100x100>" }, :default_url => "noimg.jpg"
    validates_attachment :image, :content_type => {:content_type => ["image/jpeg", "image/png", "image/gif"]}
end
