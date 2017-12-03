class Occurrence < ApplicationRecord
  scope :upcoming, lambda {where('date_time >= ?', DateTime.now).order("date_time")}
  scope :next, lambda {upcoming.first}
  belongs_to :event

  validates_presence_of :date_time
end
