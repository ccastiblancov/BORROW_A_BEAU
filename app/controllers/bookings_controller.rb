class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @profile = @booking.profile
    authorize @booking
    @review = Review.new
    @profile = @booking.profile
  end

  def my_bookings
    @bookings = current_user.bookings
    authorize @bookings
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @profile = Profile.find(params[:profile_id])
    @booking.profile = @profile
    if @booking.save
      redirect_to @booking, notice: "Booking has been created."
    else
      render :new, status: :unprocessable_entity
    end
    authorize @booking
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: "Booking is saved."
    else
      render :edit, status: :unprocessable_entity
    end
    authorize @booking
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: "Booking has been deleted.", status: :see_other
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :profile_id, :booking_id, :date)
  end
end
