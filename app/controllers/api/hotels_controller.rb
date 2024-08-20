# app/controllers/api/hotels_controller.rb
class Api::HotelsController < ApplicationController
  before_action :set_hotel, only: [:show]

  # GET /api/hotels
  def index
    if params[:q].present? && params[:q].is_a?(Hash)
      begin
        @q = Hotel.ransack(params[:q])
        @hotels = @q.result
        render json: @hotels, each_serializer: HotelSerializer
      rescue => e
        Rails.logger.error "Error in index: #{e.message}"
        render json: { error: e.message }, status: :internal_server_error
      end
    else
      Rails.logger.error "Invalid or missing query parameters"
      render json: { error: "Invalid or missing query parameters" }, status: :bad_request
    end
  end
  

  # GET /api/hotels/:id
  def show
    render json: @hotel, serializer: HotelSerializer
  rescue => e
    Rails.logger.error "Error in show: #{e.message}"
    render json: { error: e.message }, status: :internal_server_error
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.error "Hotel not found: #{e.message}"
    render json: { error: 'Hotel not found' }, status: :not_found
  end
end
