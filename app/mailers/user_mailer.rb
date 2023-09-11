class UserMailer < ApplicationMailer
  default from: Rails.application.credentials.email.user

  def welcome_email
    @user = params[:user]
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to iBudget - where money matters!')
  end
end
