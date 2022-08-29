require 'rails_helper'

RSpec.describe 'Vacation homes bookings index' do
  before :each do
    @vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)
    @booking = @vacation_home.bookings.create!(checkin: "2022-01-21", checkout: "2022-01-24", guest_surname: "Hendricks", guest_firstname: "Rebecka", guests: 4, verified: true)
    @booking2 = @vacation_home.bookings.create!(checkin: "2022-01-25", checkout: "2022-01-29", guest_surname: "Whitehall", guest_firstname: "Corey", guests: 8, verified: true)
    @booking4 = @vacation_home.bookings.create!(checkin: "2022-12-13", checkout: "2022-12-25", guest_surname: "Ramjattan", guest_firstname: "Krishna", guests: 2, verified: true)

    @vacation_home2 = VacationHome.create!(listing_name: "Beautiful getaway", location: "Louisville, KY", rating:5.0, verified:true, guest_capacity:10)
    @booking3 = @vacation_home2.bookings.create!(checkin: "2022-11-01", checkout: "2022-11-11", guest_surname: "Ramjattan", guest_firstname: "Krishna", guests: 2, verified: true)
  end

  describe 'as a visitor' do
    describe 'when I visit a vacation homes bookings page' do
      it 'I see each booking of that vacation home and each of its attributes' do
        visit "/vacation_homes/#{@vacation_home.id}/bookings"

        expect(page).to have_content(@booking.checkin)
        expect(page).to have_content(@booking.checkout)
        expect(page).to have_content(@booking.guest_surname)
        expect(page).to have_content(@booking.guest_firstname)
        expect(page).to have_content(@booking.guests)
        expect(page).to have_content(@booking.verified)

        expect(page).to have_content(@booking2.checkin)
        expect(page).to have_content(@booking2.checkout)
        expect(page).to have_content(@booking2.guest_surname)
        expect(page).to have_content(@booking2.guest_firstname)
        expect(page).to have_content(@booking2.guests)
        expect(page).to have_content(@booking2.verified)

        visit "/vacation_homes/#{@vacation_home2.id}/bookings"

        expect(page).to have_content(@booking3.checkin)
        expect(page).to have_content(@booking3.checkout)
        expect(page).to have_content(@booking3.guest_surname)
        expect(page).to have_content(@booking3.guest_firstname)
        expect(page).to have_content(@booking3.guests)
        expect(page).to have_content(@booking3.verified)
      end

      it 'I see a link to sort bookings in alphabetical order' do
        visit "/vacation_homes/#{@vacation_home.id}/bookings"

        expect(page).to have_link("Sort Bookings")
      end

      describe 'when I click on the link' do
        it 'I am taken back to the vacation home bookings and I can see all of the bookings in alphabetical order' do
          visit "/vacation_homes/#{@vacation_home.id}/bookings"

          click_on "Sort Bookings"

          expect(current_path).to eq("/vacation_homes/#{@vacation_home.id}/bookings")
          expect(@booking.guest_surname).to appear_before(@booking4.guest_surname)
          expect(@booking4.guest_surname).to appear_before(@booking2.guest_surname)
        end
      end

      describe 'next to every booking, I see a link to edit that bookings info' do
        describe 'When I click the link' do
          it 'I am taken to that bookings edit page where I can update its information' do
            visit "/vacation_homes/#{@vacation_home.id}/bookings"
            expect(page).to have_button("Edit")
            first(:button, "Edit").click
            expect(current_path).to eq("/bookings/#{@booking.id}/edit")
          end
        end
      end

      describe 'Next every booking, I see a link to delete that booking' do
        describe 'when I click the link' do
          it 'I am taken to the bookings index page where I no longer see that booking' do
            visit "vacation_homes/#{@vacation_home.id}/bookings"
            first(:button, "Delete").click
            expect(current_path).to eq("/bookings")
            expect(page).to_not have_content(@booking.guest_surname)
            expect(page).to_not have_content(@booking.guest_firstname)
          end
        end
      end
    end
  end
end
