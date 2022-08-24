class VacationHomesController < ApplicationController
  def index
    @vacation_homes = VacationHome.all
  end
end
