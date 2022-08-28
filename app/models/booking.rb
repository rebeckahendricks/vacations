class Booking < ApplicationRecord
  belongs_to :vacation_home

  def self.verified
    self.where(verified: true)
  end

  def self.sort_by_guest_surname
    self.order(:guest_surname)
  end
end
