class Occurrence < ApplicationRecord
  default_scope {order("date_time")}
  scope :upcoming, lambda {where('date_time >= ?', DateTime.now).order("date_time")}
  scope :next, lambda {upcoming.first}
  scope :date_order, lambda {order("date_time")}
  
  belongs_to :event

  validates_presence_of :date_time
end
