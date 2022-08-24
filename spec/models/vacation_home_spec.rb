require 'rails_helper'

RSpec.describe VacationHome do
  it {should have_many :bookings}
end
