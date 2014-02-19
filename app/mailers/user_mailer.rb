class UserMailer < ActionMailer::Base
  default from: "aptalertnyc@gmail.com "

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Apt Alert NYC')
  end
end