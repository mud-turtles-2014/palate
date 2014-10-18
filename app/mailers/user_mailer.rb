class UserMailer < ActionMailer::Base
  default from: "emmaleth2003@devbootcamp.com"

  def welcome_email(user)
    @user = user
    @url = 'devbootcamp.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def invite_email(email, event_wine)
  	@email = email
  	@event_wine = event_wine
  	@url  = 'localhost:3000/event_wines/' + @event_wine.id.to_s + '/edit'
  	mail(to: @email, subject: 'Join us for a wine tasting!')
  end
end
