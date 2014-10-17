class UserAnswer < ActiveRecord::Base
  belongs_to :wine_property
  belongs_to :event_wine
  belongs_to :user
end
