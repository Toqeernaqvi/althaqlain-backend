class NewsletterMailer < ApplicationMailer
  def subscription_email(user)
    @user = user
    mail(to: @user.email, subject: 'Thank you for subscribing to our newsletter')
  end
end
