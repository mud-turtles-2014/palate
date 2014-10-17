class WineQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :wine

  has_many :user_answers
end
