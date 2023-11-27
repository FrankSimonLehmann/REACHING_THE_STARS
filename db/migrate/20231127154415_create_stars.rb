class CreateStars < ActiveRecord::Migration[7.1]
  def change
    create_table :stars do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :registration_number
      t.float :price
      t.boolean :availability
      t.string :location

      t.timestamps
    end
  end
end
