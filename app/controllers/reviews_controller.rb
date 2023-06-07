class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    if @review.save
      redirect_to @booking, notice: "Review has been created."
    else
      rendor 'bookings/show', status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:booking_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to @booking, notice: "Review has been updated."
    else
      rendor 'bookings/show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
