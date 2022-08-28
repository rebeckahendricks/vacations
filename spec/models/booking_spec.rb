require 'rails_helper'

RSpec.describe Booking, type: :model do
 it {should belong_to :vacation_home}

 before :each do
   @vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)
   @booking = @vacation_home.bookings.create!(checkin: "2022-01-21", checkout: "2022-01-24", guest_surname: "Hendricks", guest_firstname: "Rebecka", guests: 4, verified: false)
   @booking2 = @vacation_home.bookings.create!(checkin: "2022-01-25", checkout: "2022-01-29", guest_surname: "Whitehall", guest_firstname: "Corey", guests: 8, verified: true)
   @booking3 = @vacation_home.bookings.create!(checkin: "2022-12-13", checkout: "2022-12-25", guest_surname: "Ramjattan", guest_firstname: "Krishna", guests: 2, verified: true)
 end

 it 'can find all verified bookings' do
   expect(Booking.verified).to eq([@booking2, @booking3])
 end

 it 'can sort bookings alphabetically by guest_surname' do
   expect(Booking.sort_by_guest_surname).to eq([@booking, @booking3, @booking2])
 end
end
