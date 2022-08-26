class VacationHome < ApplicationRecord
  has_many :bookings

  def bookings_count
    self.bookings.count
  end
end
