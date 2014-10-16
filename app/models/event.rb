class Event < ActiveRecord::Base
  has_many :event_wines

  validates :name, presence: true
  validates :location, presence: true
  validates :time, presence: true
end
