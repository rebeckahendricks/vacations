require 'rails_helper'

RSpec.describe 'Parent Child Creation' do
  before :each do
    @vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)
  end

  describe 'as a visitor' do
    describe 'when I visit a Vacation Homes Booking index page' do
      it 'I see a link to add a new booking for that vacation home called "Create Booking"' do
        visit "/vacation_homes/#{@vacation_home.id}/bookings"

        expect(page).to have_link("Create Booking")
      end
    end

    describe 'when I click the link' do
      it 'I am taken to a link where I see a form' do
        visit "/vacation_homes/#{@vacation_home.id}/bookings"
        click_on "Create Booking"

        expect(current_path).to eq("/vacation_homes/#{@vacation_home.id}/bookings/new")
        expect(page).to have_selector("input")
      end
    end

    describe 'when I fill in the form with the booking attributes and I click the button' do
      it 'a new booking is created for that vacation home and I am redirected to an index page where I can see the new booking' do
        visit "/vacation_homes/#{@vacation_home.id}/bookings/new"

        fill_in 'checkin', with: '2022-11-11'
        fill_in 'checkout', with: '2022-12-01'
        fill_in 'guest_surname', with: 'White'
        fill_in 'guest_firstname', with: 'Joe'
        choose 'verified_true'
        fill_in 'guests', with: '2'
        click_on 'Create Booking'

        expect(current_path).to eq("/vacation_homes/#{@vacation_home.id}/bookings")

        expect(page).to have_content('Joe')
      end
    end
  end
end
