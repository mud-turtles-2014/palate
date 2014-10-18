class Wine < ActiveRecord::Base
  has_many :tastings
  belongs_to :event_wine

  validates :name, presence: true
  validates :color, presence: true
  validates :description, presence: true
end
