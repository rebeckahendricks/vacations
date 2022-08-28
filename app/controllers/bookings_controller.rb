class BookingsController < ApplicationController
  def index
    @bookings = Booking.verified
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to "/bookings/#{@booking.id}"
  end

  private
  def booking_params
    params.permit(:checkin, :checkout, :guest_surname, :guest_firstname, :guests, :verified, :vacation_home_id, :updated_at)
  end
end
