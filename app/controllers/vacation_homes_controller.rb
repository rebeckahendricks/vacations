class VacationHomesController < ApplicationController
  def index
    @vacation_homes = VacationHome.all.order(created_at: :desc)
  end

  def show
    @vacation_home = VacationHome.find(params[:id])
  end
end
