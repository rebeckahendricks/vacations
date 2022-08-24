class CreateVacationHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :vacation_homes do |t|
      t.string :listing_name
      t.string :location
      t.decimal :rating
      t.boolean :verified
      t.integer :guest_capacity
      t.timestamps
    end
  end
end
