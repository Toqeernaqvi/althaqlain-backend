class ReviewsController < ApplicationController
  before_action :set_hotel

  def create
    @review = @hotel.reviews.build(review_params)
    if @review.save
      redirect_to @hotel, notice: 'Review was successfully created.'
    else
      redirect_to @hotel, alert: 'Error creating review.'
    end
  end

  def update
    @review = @hotel.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to @hotel, notice: 'Review was successfully updated.'
    else
      redirect_to @hotel, alert: 'Error updating review.'
    end
  end

  def destroy
    @review = @hotel.reviews.find(params[:id])
    @review.destroy
    redirect_to @hotel, notice: 'Review was successfully destroyed.'
  end

  private

    def set_hotel
      @hotel = Hotel.find(params[:hotel_id])
    end

    def review_params
      params.require(:review).permit(:name, :message)
    end
end
