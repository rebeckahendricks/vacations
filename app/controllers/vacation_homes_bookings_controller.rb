class VacationHomesBookingsController < ApplicationController
  def index
    @vacation_home = VacationHome.find(params[:id])
    @bookings = @vacation_home.bookings
  end
end
