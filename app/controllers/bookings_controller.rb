class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[destroy]

  def create
    @gear = Gear.find(params[:gear_id])
    @booking = @gear.bookings.build(bookings_params)
    @booking.user = current_user
    @booking.total_price = calculate_total_price(@booking)
    if @booking.save
      redirect_to bookings_path
    else
      render 'gears/show', status: :unprocessable_entity
    end
  end

  def index
    @bookings = current_user.bookings.includes(:gear)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def calculate_total_price(booking)
    (booking.end_date - booking.start_date).to_i * booking.gear.price_per_day
  end
end
