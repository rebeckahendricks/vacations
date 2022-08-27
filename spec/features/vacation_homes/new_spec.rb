require 'rails_helper'

RSpec.describe 'Vacation homes new page:' do
  describe 'as a visitor' do
    it 'I see a form for new vacation homes record' do
      visit "/vacation_homes/new"

      expect(page).to have_selector("input")
    end
  end

  describe 'When I fill out the form with a new vacation homes attributes' do
    describe 'and I click the button "Create Vacation Home" to submit the form' do
      it 'then a POST request is sent to the "/vacation_homes" route and a new vacation home record is created,I am redirected to the Vacation Home index page,the new vacation home is displayed' do
        visit "/vacation_homes/new"
        fill_in 'listing_name', with: 'Beautiful apartment'
        fill_in 'location', with: 'California'
        fill_in 'rating', with: '3.5'
        choose 'verified_true'
        fill_in 'guest_capacity', with: '5'
        click_on 'Create Vacation Home Listing'

        expect(current_path).to eq('/vacation_homes')

        expect(page).to have_content('Beautiful apartment')
      end
    end
  end
end
