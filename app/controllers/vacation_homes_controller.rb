class VacationHomesController < ApplicationController
  def index
    @vacation_homes = VacationHome.order_by_creation
  end

  def show
    @vacation_home = VacationHome.find(params[:id])
  end

  def new
  end

  def create
    vacation_home = VacationHome.create(vacation_home_params)
    redirect_to '/vacation_homes'
  end

  def edit
    @vacation_home = VacationHome.find(params[:id])
  end

  def update
    @vacation_home = VacationHome.find(params[:id])
    @vacation_home.update(vacation_home_params)
    redirect_to "/vacation_homes/#{@vacation_home.id}"
  end

  private
  def vacation_home_params
    params.permit(:listing_name, :location, :rating, :verified, :guest_capacity)
  end
end
