class Event < ActiveRecord::Base
  has_many :event_wines, :dependent => :destroy
  has_many :wine_bringers, through: :event_wines
  has_many :wines, through: :event_wines

  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :time, presence: true

  def attending_invitations
    self.event_wines.select {|invite| invite.is_attending}
  end

  def attending_users
    attending_invitations.map {|invite| invite.wine_bringer}
  end

  def winelist
    attending_invitations.map {|invite| invite.wine}
  end

  def assign_unique_wine
    all_wines = Wine.all
    event_wine_list = self.winelist
    unassigned = all_wines - event_wine_list
    unassigned.sample
  end
end
