require 'rails_helper'

RSpec.describe 'Vacation Homes index page' do
  before :each do
    @vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)
    @booking = @vacation_home.bookings.create!(checkin: "2022-01-21", checkout: "2022-01-24", guest_surname: "Hendricks", guest_firstname: "Rebecka", guests: 4, verified: true)
    @booking2 = @vacation_home.bookings.create!(checkin: "2022-01-25", checkout: "2022-01-29", guest_surname: "Whitehall", guest_firstname: "Corey", guests: 8, verified: true)

    @vacation_home2 = VacationHome.create!(listing_name: "Beautiful getaway", location: "Louisville, KY", rating:5.0, verified:true, guest_capacity:10)
    @booking3 = @vacation_home2.bookings.create!(checkin: "2022-11-01", checkout: "2022-11-11", guest_surname: "Ramjattan", guest_firstname: "Krishna", guests: 2, verified: true)
  end
  describe 'As a visitor' do
    describe 'when I visit "/vacation_homes"' do
      it 'I see the name of each vacation_homes record in the system' do
        visit "/vacation_homes"

        expect(page).to have_content(@vacation_home.listing_name)
        expect(page).to have_content(@vacation_home2.listing_name)
      end

      it 'I see that records are ordered by most recently created first' do
        visit "/vacation_homes"

        expect(@vacation_home2.listing_name).to appear_before(@vacation_home.listing_name)
      end

      it 'next to each of the records I see when it was created' do
        visit "/vacation_homes"

        expect(page).to have_content(@vacation_home.created_at)
        expect(page).to have_content(@vacation_home2.created_at)
      end
    end

    describe 'when I visit any page on the site' do
      describe 'I see a link at the top of the page that takes me to the vacation homes index' do
        it 'has a link to vacation homes index on the top of each page' do
          visit '/'
          expect(page).to have_link("View all Vacation Homes")
          click_on "View all Vacation Homes"
          expect(current_path).to eq('/vacation_homes')

          visit '/bookings'
          expect(page).to have_link("View all Vacation Homes")
          click_on "View all Vacation Homes"
          expect(current_path).to eq('/vacation_homes')

          visit "/vacation_homes/#{@vacation_home.id}"
          expect(page).to have_link("View all Vacation Homes")
          click_on "View all Vacation Homes"
          expect(current_path).to eq('/vacation_homes')

          visit "/bookings/#{@booking.id}"
          expect(page).to have_link("View all Vacation Homes")
          click_on "View all Vacation Homes"
          expect(current_path).to eq('/vacation_homes')

          visit "/vacation_homes/#{@vacation_home.id}/bookings"
          expect(page).to have_link("View all Vacation Homes")
          click_on "View all Vacation Homes"
          expect(current_path).to eq('/vacation_homes')
        end
      end
    end
  end
end
