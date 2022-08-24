class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :checkin
      t.date :checkout
      t.string :guest_surname
      t.string :guest_firstname
      t.integer :guests
      t.boolean :verified
      t.reference :vacation_home, foreign_key: true
      t.timestamps
    end
  end
end
