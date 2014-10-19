class Event < ActiveRecord::Base
  has_many :event_wines
  has_many :wine_bringers, through: :event_wines
  has_many :wines, through: :event_wines

  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :time, presence: true

  # return array of user objs
  # update to reflect is_attending col on event_wines
  def attending_users
    attending =[]
    invites = self.event_wines
    invites.each do |invite|
      if invite.is_attending == true
        attending << invite.wine_bringer
      end
    end
    attending
  end

  def winelist
    wines =[]
    invites = self.event_wines
    invites.each do |event_wine|
      if event_wine.is_attending
        wines << event_wine.wine
      end
    end
    wines
  end
end
