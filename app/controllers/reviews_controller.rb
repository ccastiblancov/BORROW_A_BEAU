class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    authorize @review
    @review.booking = @booking
    @review.profile = @booking.profile
    if @review.save
      redirect_to @booking, notice: "Review has been created."
    else
      redirect_to @booking, notice: "Review could not be processed. Please add a text.", status: :unprocessable_entity
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
