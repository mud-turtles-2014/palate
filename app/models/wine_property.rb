class WineProperty < ActiveRecord::Base
  belongs_to :property
  belongs_to :wine

  has_many :user_answers
end
