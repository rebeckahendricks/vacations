require 'rails_helper'

RSpec.describe "Vacation Homes edit feature" do
  before :each do
    @vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)
  end

  describe 'Update Vacation Homes' do

    it 'has a link to update vacation home' do
      visit "/vacation_homes/#{@vacation_home.id}"

      expect(page).to have_link("Update Vacation Home")
    end

    it 'I am taken to a new form to update the vacation home where I see a form to update vacation home attributes' do
      visit "/vacation_homes/#{@vacation_home.id}"

      click_link "Update Vacation Home"

      expect(current_path).to eq("/vacation_homes/#{@vacation_home.id}/edit")
      expect(page).to have_selector("input")
    end

    it 'when I fill out the form with updated information and I click the botton to submit the form, the vacation home info is updated and I am redirected to the vacation home show page where I see the updated info' do
      visit "/vacation_homes/#{@vacation_home.id}"

      click_link "Update Vacation Home"

      fill_in 'listing_name', with: 'Gorgeous home by the ocean'

      click_on "Update Vacation Home"

      expect(current_path).to eq("/vacation_homes/#{@vacation_home.id}")
      expect(page).to have_content("Gorgeous home by the ocean")
    end
  end
end
