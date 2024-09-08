class ContactMailer < ApplicationMailer
  default from: 'your-email@example.com' # Replace with your desired sender email

  def send_message(contact_params)
    @name = contact_params[:full_name]
    @message = contact_params[:message]
    @contact_email = contact_params[:email]
    
    mail(
      to: 'your-email@example.com', # Replace with the email where you'd like to receive the messages
      subject: 'New Contact Us Message'
    )
  end
end
