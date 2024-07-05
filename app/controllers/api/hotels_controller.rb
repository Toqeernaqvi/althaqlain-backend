# app/controllers/api/hotels_controller.rb
class Api::HotelsController < ApplicationController
    before_action :set_hotel, only: [:show]
  
    # GET /api/hotels
    def index
      @hotels = Hotel.all
      render json: @hotels
    end
  
    # GET /api/hotels/:id
    def show
      render json: @hotel
    end
  
    private
  
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end
  end
  