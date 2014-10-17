class UserMailer < ActionMailer::Base
  default from: "emmaleth2003@devbootcamp.com"

  def welcome_email(user)
    @user = user
    @url = 'devbootcamp.com'
    # @url  = 'localhost:3000/event_wines/' + user.event_wines.id + '/edit'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
