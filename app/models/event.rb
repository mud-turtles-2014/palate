class Event < ActiveRecord::Base
  has_many :event_wines

  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :time, presence: true

  # return array of user objs
  def attending_users
    self.event_wines.map {|event_wine| event_wine.wine_bringer }
  end

  def winelist
    self.event_wines.map {|event_wine| event_wine.wine }
  end
end
