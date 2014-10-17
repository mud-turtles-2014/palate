class Question < ActiveRecord::Base
  has_many :wine_questions
  has_many :user_answers, through: :wine_questions
end
