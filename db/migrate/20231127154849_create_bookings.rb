class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :star, null: false, foreign_key: true
      t.boolean :booking_status, default: false
      t.text :comment
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
