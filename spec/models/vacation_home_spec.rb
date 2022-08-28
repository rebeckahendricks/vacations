require 'rails_helper'

# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent

RSpec.describe VacationHome do
  it {should have_many :bookings}

  before :each do
    @vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)
    @booking = @vacation_home.bookings.create!(checkin: "2022-01-21", checkout: "2022-01-24", guest_surname: "Hendricks", guest_firstname: "Rebecka", guests: 4, verified: true)
    @booking2 = @vacation_home.bookings.create!(checkin: "2022-01-25", checkout: "2022-01-29", guest_surname: "Whitehall", guest_firstname: "Corey", guests: 8, verified: true)

    @vacation_home2 = VacationHome.create!(listing_name: "Beautiful getaway", location: "Louisville, KY", rating:5.0, verified:true, guest_capacity:10)
    @booking3 = @vacation_home2.bookings.create!(checkin: "2022-11-01", checkout: "2022-11-11", guest_surname: "Ramjattan", guest_firstname: "Krishna", guests: 2, verified: true)
  end

  it 'can count the number of bookings each vacation home has' do
    expect(@vacation_home.bookings_count).to eq(2)
    expect(@vacation_home2.bookings_count).to eq(1)
  end

  it 'can order vacation homes by the date most recently created' do
    expect(VacationHome.order_by_creation).to eq([@vacation_home2, @vacation_home])
  end
end
