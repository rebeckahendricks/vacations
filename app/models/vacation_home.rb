class VacationHome < ApplicationRecord
  has_many :bookings, :dependent => :delete_all

  def bookings_count
    self.bookings.count
  end

  def self.order_by_creation
    self.order(created_at: :desc)
  end
end
