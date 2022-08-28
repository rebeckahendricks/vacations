class VacationHomesBookingsController < ApplicationController
  def index
    @vacation_home = VacationHome.find(params[:id])
    @bookings = if params[:sort_by_guest_surname] == "guest_surname"
      Booking.sort_by_guest_surname
    else
      Booking.verified
    end
  end

  def new
    @vacation_home = VacationHome.find(params[:id])
  end

  def create
    vacation_home = VacationHome.find(params[:id])
    booking = Booking.create(booking_params)
    redirect_to "/vacation_homes/#{vacation_home.id}/bookings"
  end

  private
  def booking_params
    params.permit(:checkin, :checkout, :guest_surname, :guest_firstname, :guests, :verified, :vacation_home_id)
  end
end
