class BookingsController < ApplicationController
  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user
    @booking.user.role = 'customer'
    if @booking.save
      redirect_to my_bookings_path
    else
      render 'flats/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
