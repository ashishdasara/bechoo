class UserMailer < ApplicationMailer
  default from: 'bechoosite@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Bechoo.com")
  end

  def account_confirmation(user)
    @user = user
    mail(to: @user.email, subject: "Account created successfully!!")
  end

  def contact_message_email(reciever_id, sender_id)
    @reciever = User.find(reciever_id)
    @sender = User.find(sender_id)
    mail(to: @reciever.email, subject: "New conversation")
  end
end
