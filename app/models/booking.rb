class Booking < ApplicationRecord
  belongs_to :vacation_home

  def self.verified
    self.where(verified: true)
  end

  def self.sort_by_guest_surname
    self.order(:guest_surname)
  end

  def self.guests_more_than(number)
    self.where("guests > #{number}")
  end
end
