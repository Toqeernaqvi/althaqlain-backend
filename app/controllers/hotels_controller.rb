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
    if @hotel.update(hotel_params)
      redirect_to @hotel, notice: 'Hotel was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @hotel.destroy
    redirect_to hotels_url, notice: 'Hotel was successfully destroyed.'
  end

  private

    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def hotel_params
      params.require(:hotel).permit(:name, :city, :country, :state, :address, :loc_lat, :loc_long, :rating, :price, :discounted_price, :bed, :living_room, :bathroom, :kitchen, :reserved_room, facilities: {}, paragraphs: {}, images: [])
    end
end
