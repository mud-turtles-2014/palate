class Wine < ActiveRecord::Base
  belongs_to :wine_question
  belongs_to :event_wine

  validates :name, presence: true
  validates :color, presence: true
  validates :description, presence: true
end
