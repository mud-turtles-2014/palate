class User < ActiveRecord::Base
  has_secure_password

  has_many :event_wines
  has_many :events
  has_many :tastings

  validates :email,     presence: true,
                        format: { :with => /\w+@\w+\.\w+/}
  validates :name,      presence: true

  validates :password,  length: { minimum: 3 },
                        confirmation: true,
                        presence: true

  def upcoming_events
    reservations = self.event_wines.where(event: Event.where(['date >= ?', Time.now]))
    reservations.map {|reservation| Event.find(reservation.event_id)} if reservations
  end

  def past_events
    reservations = self.event_wines.where(event: Event.where(['date < ?', Time.now]))
    reservations.map {|reservation| Event.find(reservation.event_id)} if reservations
  end

end
