require 'rails_helper'

RSpec.describe 'Bookings index page' do
  before :each do
    @vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)
    @booking = @vacation_home.bookings.create!(checkin: "2022-01-21", checkout: "2022-01-24", guest_surname: "Hendricks", guest_firstname: "Rebecka", guests: 4, verified: false)
    @booking2 = @vacation_home.bookings.create!(checkin: "2022-01-25", checkout: "2022-01-29", guest_surname: "Whitehall", guest_firstname: "Corey", guests: 8, verified: true)
  end

  describe 'as a visitor' do
    describe 'when I visit "/bookings"' do
      describe 'I only see records where the boolean column is true' do
        it 'only displays bookings where the user is verified' do
          visit '/bookings'

          expect(page).to have_content(@booking2.guest_surname)
          expect(page).to have_content(@booking2.guest_firstname)
          expect(page).to_not have_content(@booking.guest_surname)
          expect(page).to_not have_content(@booking.guest_firstname)
        end
      end

      describe 'I see each booking in the system' do
        it 'displays the booking attributes' do
          visit '/bookings'

          expect(page).to have_content(@booking2.checkin)
          expect(page).to have_content(@booking2.checkout)
          expect(page).to have_content(@booking2.guest_surname)
          expect(page).to have_content(@booking2.guest_firstname)
          expect(page).to have_content(@booking2.guests)
          expect(page).to have_content(@booking2.verified)
        end
      end

      describe 'next to every booking, I see a link to edit that bookings info' do
        describe 'When I click the link' do
          it 'I am taken to that bookings edit page where I can update its information' do
            visit '/bookings/'
            expect(page).to have_link("Edit")
            first(:link, "Edit").click
            expect(current_path).to eq("/bookings/#{@booking2.id}/edit")
          end
        end
      end

      describe 'Next every booking, I see a link to delete that booking' do
        describe 'when I click the link' do
          it 'I am taken to the bookings index page where I no longer see that booking' do
            visit '/bookings'
            first(:button, "Delete").click
            expect(current_path).to eq("/bookings")
            expect(page).to_not have_content(@booking.guest_surname)
            expect(page).to_not have_content(@booking.guest_firstname)
          end
        end
      end
    end

    describe 'when I visit any page on the site' do
      describe 'I see a link at the top of the page that takes me to the bookings index' do
        it 'has a link to bookings index on the top of each page' do
          visit '/'
          expect(page).to have_link("View all Bookings")
          click_on "View all Bookings"
          expect(current_path).to eq('/bookings')

          visit '/vacation_homes'
          expect(page).to have_link("View all Bookings")
          click_on "View all Bookings"
          expect(current_path).to eq('/bookings')

          visit "/vacation_homes/#{@vacation_home.id}"
          expect(page).to have_link("View all Bookings")
          click_on "View all Bookings"
          expect(current_path).to eq('/bookings')

          visit "/bookings/#{@booking.id}"
          expect(page).to have_link("View all Bookings")
          click_on "View all Bookings"
          expect(current_path).to eq('/bookings')

          visit "/vacation_homes/#{@vacation_home.id}/bookings"
          expect(page).to have_link("View all Bookings")
          click_on "View all Bookings"
          expect(current_path).to eq('/bookings')
        end
      end
    end
  end
end
