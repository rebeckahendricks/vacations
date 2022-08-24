require 'rails_helper'

RSpec.describe 'Vacation Homes show page' do
  describe 'As a visitor' do
    describe 'when I visit "/vacation_homes/:id"' do
      describe 'I see the vacation home with that id including the vacation home attributes:' do
        it 'displays the vacation home listing name' do
          vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)

          visit "/vacation_homes/#{vacation_home.id}"
          expect(page).to have_content(vacation_home.listing_name)
        end

        it 'displays the location' do
          vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)

          visit "/vacation_homes/#{vacation_home.id}"
          expect(page).to have_content(vacation_home.location)
        end

        it 'displays the rating' do
          vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)

          visit "/vacation_homes/#{vacation_home.id}"
          expect(page).to have_content(vacation_home.rating)
        end

        it 'displays if it is verified' do
          vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)

          visit "/vacation_homes/#{vacation_home.id}"
          expect(page).to have_content(vacation_home.verified)
        end

        it 'displays the guest capacity' do
          vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)

          visit "/vacation_homes/#{vacation_home.id}"
          expect(page).to have_content(vacation_home.guest_capacity)
        end

        it 'displays the created at timestamp' do
          vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)

          visit "/vacation_homes/#{vacation_home.id}"
          expect(page).to have_content(vacation_home.created_at)
        end

        it 'displays the updated at timestamp' do
          vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)

          visit "/vacation_homes/#{vacation_home.id}"
          expect(page).to have_content(vacation_home.updated_at)
        end
      end
    end
  end
end
