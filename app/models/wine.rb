class Wine < ActiveRecord::Base
  has_many :wine_properties
  has_many :properties, through: :wine_properties
  belongs_to :event_wine

  validates :name, presence: true
  validates :color, presence: true
  validates :description, presence: true
end
