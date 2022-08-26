require 'rails_helper'

RSpec.describe 'Vacation Homes show page' do
  before :each do
    @vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)
    @booking = @vacation_home.bookings.create!(checkin: "2022-01-21", checkout: "2022-01-24", guest_surname: "Hendricks", guest_firstname: "Rebecka", guests: 4, verified: true)
    @booking2 = @vacation_home.bookings.create!(checkin: "2022-01-25", checkout: "2022-01-29", guest_surname: "Whitehall", guest_firstname: "Corey", guests: 8, verified: true)

    @vacation_home2 = VacationHome.create!(listing_name: "Beautiful getaway", location: "Louisville, KY", rating:5.0, verified:true, guest_capacity:10)
    @booking3 = @vacation_home2.bookings.create!(checkin: "2022-11-01", checkout: "2022-11-11", guest_surname: "Ramjattan", guest_firstname: "Krishna", guests: 2, verified: true)
  end

  describe 'As a visitor' do
    describe 'when I visit "/vacation_homes/:id"' do
      describe 'I see the vacation home with that id including the vacation home attributes:' do
        it 'displays the vacation home attributes' do
          visit "/vacation_homes/#{@vacation_home.id}"
          expect(page).to have_content(@vacation_home.listing_name)
          expect(page).to have_content(@vacation_home.location)
          expect(page).to have_content(@vacation_home.rating)
          expect(page).to have_content(@vacation_home.verified)
          expect(page).to have_content(@vacation_home.guest_capacity)
        end
      end

      describe 'I see a count of the number of bookings associated with that vacation home' do
        it 'displays the count of bookings for each vacation home' do
          visit "/vacation_homes/#{@vacation_home.id}/"
          expect(page).to have_content("Number of Bookings: 2")

          visit "/vacation_homes/#{@vacation_home2.id}/"
          expect(page).to have_content("Number of Bookings: 1")
        end
      end
    end
  end
end
