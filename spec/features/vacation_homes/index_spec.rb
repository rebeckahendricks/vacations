require 'rails_helper'

RSpec.describe 'Vacation Homes index page' do
  before :each do
    @vacation_home1 = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)
    @vacation_home2 = VacationHome.create!(listing_name: "Fabulous getaway", location: "Miami, FL", rating:5.0, verified:true, guest_capacity:10)
  end
  describe 'As a visitor' do
    describe 'when I visit "/vacation_homes"' do
      it 'I see the name of each vacation_homes record in the system' do
        visit "/vacation_homes"

        expect(page).to have_content(@vacation_home1.listing_name)
        expect(page).to have_content(@vacation_home2.listing_name)
      end

      it 'I see that records are ordered by most recently created first' do
        visit "/vacation_homes"

        expect(@vacation_home2.listing_name).to appear_before(@vacation_home1.listing_name)
      end

      it 'next to each of the records I see when it was created' do
        visit "/vacation_homes"

        expect(page).to have_content(@vacation_home1.created_at)
        expect(page).to have_content(@vacation_home2.created_at)
      end
    end
  end
end
