class BookingsController < ApplicationController

  def index
    @bookings = Bookings.all
  end

  def new
    @booking = Bookings.new
    @booking.user = current_user
  end

  def create
    @booking = Bookings.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: "Booking has been created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: "Booking is saved."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: "Booking has been deleted.", status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :profile_id)
  end
end
