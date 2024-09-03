class Api::SubscriptionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = SubscribedUser.find_or_create_by(email: params[:email]) do |u|
      u.name = params[:name]
    end
    
    if user.persisted?
      NewsletterMailer.subscription_email(user).deliver_later
      render json: { message: 'Subscription successful' }, status: :ok
    else
      render json: { error: 'Subscription failed' }, status: :unprocessable_entity
    end
  end
end
