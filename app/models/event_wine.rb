class EventWine < ActiveRecord::Base
  belongs_to :event
  belongs_to :wine
  belongs_to :wine_bringer, class_name: "User", foreign_key: "user_id"

  has_many :user_answers
end
