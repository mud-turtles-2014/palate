class UserMailer < ActionMailer::Base
  default from: "wine-tasting@devbootcamp.com"

  def welcome_email(user)
    @user = user
    @url = 'http://pacific-retreat-6443.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def invite_email(email, event_wine)
  	@email = email
  	@event_wine = event_wine
  	@url  = 'http://pacific-retreat-6443.herokuapp.com/event_wines/' + @event_wine.id.to_s + '/edit'
  	mail(to: @email, subject: 'Join us for a wine tasting!')
  end
end
