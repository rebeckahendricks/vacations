require 'rails_helper'

RSpec.describe 'bookings show page' do
  before :each do
    @vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)
    @booking = @vacation_home.bookings.create!(checkin: "2022-01-21", checkout: "2022-01-24", guest_surname: "Hendricks", guest_firstname: "Rebecka", guests: 4, verified: true)
    @booking2 = @vacation_home.bookings.create!(checkin: "2022-01-25", checkout: "2022-01-29", guest_surname: "Whitehall", guest_firstname: "Corey", guests: 8, verified: true)
  end

  describe 'As a visitor' do
    describe 'when I visit "/bookings/:id"' do
      it 'then I see the booking with that id and its attributes' do
        visit "/bookings/#{@booking.id}"

        expect(page).to have_content(@booking.checkin)
        expect(page).to have_content(@booking.checkout)
        expect(page).to have_content(@booking.guest_surname)
        expect(page).to have_content(@booking.guest_firstname)
        expect(page).to have_content(@booking.guests)
        expect(page).to have_content(@booking.verified)
        expect(page).to_not have_content(@booking2.checkin)
      end

      describe 'Then I see a link to delete the booking. When I click the link to delete,' do
        it 'deletes the booking and I am redirected to the booking index page where I no longer see that booking' do
          visit "/bookings/#{@booking.id}"

          click_on "Delete Booking"
          
          expect(current_path).to eq("/bookings")
          expect(page).to_not have_content(@booking.guest_firstname)
        end
      end
    end
  end
end
