class Event < ActiveRecord::Base
  has_many :event_wines

  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  validates :name, presence: true
  validates :location, presence: true
  validates :time, presence: true
end
