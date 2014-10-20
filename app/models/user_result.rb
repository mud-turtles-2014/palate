class UserResult < ActiveRecord::Base
  belongs_to :tasting
  has_one :user, through: :tasting
  has_one :event_wine, through: :tasting
  has_one :wine, through: :event_wine
  has_one :event, through: :event_wine

end

