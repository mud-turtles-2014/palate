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
  
  before_create :create_remember_digest

  def upcoming_events
    reservations = self.event_wines.where(event: Event.where(['date >= ?', Time.now]))
    reservations.map {|reservation| Event.find(reservation.event_id)} if reservations
  end

  def past_events
    reservations = self.event_wines.where(event: Event.where(['date < ?', Time.now]))
    reservations.map {|reservation| Event.find(reservation.event_id)} if reservations
  end

  def name_or_email
    if self.name != "Guest"
      return self.name
    else
      return self.email
    end
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def create_remember_digest
    self.remember_digest = Digest::SHA1.hexdigest(User.new_token)
  end

  def self.find_from_remember_digest token
    find_by(remember_digest: Digest::SHA1.hexdigest(token))

  end

end
