require 'rails_helper'

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:
RSpec.describe 'Bookings index page' do
  before :each do
    @vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)
    @booking = @vacation_home.bookings.create!(checkin: "2022-01-21", checkout: "2022-01-24", guest_surname: "Hendricks", guest_firstname: "Rebecka", guests: 4, verified: true)
    # @booking2 = Booking.create!(checkin: "2022-01-25", checkout: "2022-01-29", guest_surname: "Whitehall", guest_firstname: "Corey", guests: 8, verified: true)
  end

  it 'displays the booking attributes' do
    visit '/bookings'

    expect(page).to have_content(@booking.checkin)
    expect(page).to have_content(@booking.checkout)
    expect(page).to have_content(@booking.guest_surname)
    expect(page).to have_content(@booking.guest_firstname)
    expect(page).to have_content(@booking.guests)
    expect(page).to have_content(@booking.verified)
  end
end
