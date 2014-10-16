class UserMailer < ActionMailer::Base
  default from: "welcome@example.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to The Wine App!')
  end

end
