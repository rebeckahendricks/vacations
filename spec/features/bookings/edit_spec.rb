require 'rails_helper'

RSpec.describe 'Bookings edit feature' do
  before :each do
    @vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)
    @booking = @vacation_home.bookings.create!(checkin: "2022-01-21", checkout: "2022-01-24", guest_surname: "Hendricks", guest_firstname: "Rebecka", guests: 4, verified: true)
  end

  describe 'When I visit a booking show page' do
    it 'has a link to update that booking' do
      visit "/bookings/#{@booking.id}"

      expect(page).to have_link("Update Booking")
    end
  end

  describe 'When I click the link' do
    it 'goes to a page where there is a form to edit the booking attributes' do
      visit "/bookings/#{@booking.id}"

      click_link "Update Booking"

      expect(current_path).to eq("/bookings/#{@booking.id}/edit")
      expect(page).to have_selector("input")
    end
  end

  describe 'When I fill out the form and click the link to submit the form' do
    it 'updates the booking data and redirects to the booking show page where I can see the updated booking information' do
      visit "/bookings/#{@booking.id}/edit"

      fill_in 'guest_firstname', with: 'Becka'

      click_on 'Update Booking'

      expect(current_path).to eq("/bookings/#{@booking.id}")
      expect(page).to have_content("Becka")
    end
  end

end
