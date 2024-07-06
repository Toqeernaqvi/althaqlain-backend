class HotelsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  def index
    @hotels = Hotel.all
  end

  def show
  end

  def new
    @hotel = Hotel.new
  end

  def edit
  end

  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
        format.json { render :show, status: :created, location: @hotel }
        
        params[:hotel][:images].each do |image|
          @hotel.images.attach(image)
         end
      else
        format.html { render :new }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:hotel][:base_image].present?
      @hotel.base_image.attach(params[:hotel][:base_image])
      Rails.logger.debug("Base image attached: #{@hotel.base_image.attached?}")
    end
    hotel_update_params = params[:hotel][:images] == [""] ? hotel_params.except(:images) : hotel_params
    if @hotel.update(hotel_update_params)
      redirect_to @hotel, notice: 'Hotel was successfully updated.'
    else
      render :edit
    end
  end

  private
  
  def hotel_params
    params.require(:hotel).permit(:name, :city, :country, :state, :address, :loc_lat, :loc_long, :rating, :price, :discounted_price, :bed, :living_room, :bathroom, :kitchen, :reserved_room, :facilities, :paragraphs, images: [], base_image: [])
  end

  def destroy
    @hotel.destroy
    redirect_to hotels_url, notice: 'Hotel was successfully destroyed.'
  end

  def delete_image
    @hotel = Hotel.find(params[:id])
    @hotel.images.find_by(id: params[:image_id]).purge
    redirect_to edit_hotel_path(@hotel), notice: "Image deleted successfully."
  end

  private

    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def hotel_params
      params.require(:hotel).permit(:name, :city, :country, :state, :address, :loc_lat, :loc_long, :rating, :price, :discounted_price, :bed, :living_room, :bathroom, :kitchen, :reserved_room, :base_image, facilities: {}, paragraphs: {}, images: [])
    end
end
