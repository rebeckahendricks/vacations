require 'rails_helper'

RSpec.describe 'Vacation Homes index page' do
  describe 'As a visitor' do
    describe 'when I visit "/vacation_homes"' do
      describe "I see the name of each vacation_homes record in the system" do
        it 'displays the listing names of each vacation home' do
          vacation_home1 = VacationHome.create!(listing_name: "Gorgeous home", city: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)
          vacation_home2 = VacationHome.create!(listing_name: "Fabulous getaway", city: "Miami, FL", rating:5.0, verified:true, guest_capacity:10)
          visit "/vacation_homes"

          expect(page).to have_content(vacation_home1.listing_name)
          expect(page).to have_content(vacation_home2.listing_name)
        end
      end
    end
  end
end
