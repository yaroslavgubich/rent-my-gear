class BookingsController < ApplicationController
  before_action :authenticate_user!
  def create
    @gear = Gear.find(params[:gear_id])
    @booking = @gear.bookings.build(bookings_params)
    @booking.user = current_user
    @booking.total_price = calculate_total_price
    if @booking.save
      redirect_to bookings_path
    else
      render :show
    end
  end
  def index
    @bookings = current_user.bookings
  end
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end
  private
  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
  def calculate_total_price
    (@booking.end_date - @booking.start_date).to_i * @gear.price_per_day
  end
end