class HotelsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_hotel, only: [:show, :edit, :update, :destroy, :delete_image]

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
        format.html { redirect_to @hotel, notice: 'Hotel was successfully created. ' }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    # Ensure to permit the base_image and images parameters
    hotel_update_params = hotel_params.except(:base_image, :images)
  
    # Attach the new base_image if present
    if params[:hotel][:base_image].present?
      @hotel.base_image.attach(params[:hotel][:base_image])
    end
  
    # Handle images parameter
    if params[:hotel][:images].present? && params[:hotel][:images] != [""]
      @hotel.images.attach(params[:hotel][:images])
    end
  
    # Update the hotel with the sanitized parameters
    if @hotel.update(hotel_update_params)
      redirect_to @hotel, notice: 'Hotel was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @hotel.destroy
    redirect_to hotels_url, notice: 'Hotel was successfully destroyed.'
  end

  def delete_image
    @hotel.images.find_by(id: params[:image_id]).purge
    redirect_to edit_hotel_path(@hotel), notice: "Image deleted successfully."
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(:name, :city, :country, :state, :address, :loc_lat, :loc_long, :rating, :price, :discounted_price, :bed, :living_room, :bathroom, :kitchen, :reserved_room, :base_image, :description, images: [])
  end

end
