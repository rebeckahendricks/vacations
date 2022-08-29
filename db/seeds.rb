# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
VacationHome.destroy_all

@vacation_home = VacationHome.create!(listing_name: "Gorgeous home", location: "San Jose, Costa Rica", rating:4.9, verified:true, guest_capacity:6)
@booking = @vacation_home.bookings.create!(checkin: "2022-01-21", checkout: "2022-01-24", guest_surname: "Hendricks", guest_firstname: "Rebecka", guests: 4, verified: false)
@booking2 = @vacation_home.bookings.create!(checkin: "2022-01-25", checkout: "2022-01-29", guest_surname: "Whitehall", guest_firstname: "Corey", guests: 8, verified: true)
@booking3 = @vacation_home.bookings.create!(checkin: "2022-12-13", checkout: "2022-12-25", guest_surname: "Ramjattan", guest_firstname: "Krishna", guests: 2, verified: true)

@vacation_home2 = VacationHome.create!(listing_name: "Beautiful getaway", location: "Louisville, KY", rating:5.0, verified:true, guest_capacity:10)
@booking4 = @vacation_home2.bookings.create!(checkin: "2022-11-01", checkout: "2022-11-11", guest_surname: "Whipkey", guest_firstname: "Carla", guests: 2, verified: true)

@vacation_home3 = VacationHome.create!(listing_name: "Jungle treehouse", location: "San Jose, Costa Rica", rating:5.0, verified:true, guest_capacity:8)
@booking5 = @vacation_home3.bookings.create!(checkin: "2022-01-21", checkout: "2022-01-24", guest_surname: "Hendricks", guest_firstname: "Daniel", guests: 4, verified: false)
@booking6 = @vacation_home3.bookings.create!(checkin: "2022-01-25", checkout: "2022-01-29", guest_surname: "Straka", guest_firstname: "Ali", guests: 8, verified: true)
@booking7 = @vacation_home3.bookings.create!(checkin: "2022-12-13", checkout: "2022-12-25", guest_surname: "Moyo", guest_firstname: "Chris", guests: 2, verified: true)
