class Property < ActiveRecord::Base
  has_many :wine_properties
  has_many :wines, through: :wine_properties
  has_many :user_answers, through: :wine_properties
  has_many :options
end
