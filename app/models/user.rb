class User < ActiveRecord::Base
  has_secure_password

  has_many :event_wines

  validates :email, presence: true
  validates :name, presence: true
end
