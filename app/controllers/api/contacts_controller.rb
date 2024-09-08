class Api::ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  # POST /contact
  def create
    contact_params = params.require(:contact).permit(:full_name, :email, :message)
    
    # Send the email
    ContactMailer.send_message(contact_params).deliver_now

    render json: { message: "Your message has been sent successfully!" }, status: :ok
  rescue => e
    render json: { error: "Failed to send message: #{e.message}" }, status: :unprocessable_entity
  end
end
