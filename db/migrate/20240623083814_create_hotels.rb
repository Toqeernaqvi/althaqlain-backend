class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :state
      t.string :address
      t.float :loc_lat
      t.float :loc_long
      t.float :rating
      t.integer :price
      t.integer :discounted_price
      t.integer :bed
      t.integer :living_room
      t.integer :bathroom
      t.integer :kitchen
      t.integer :reserved_room
      t.json :facilities
      t.json :paragraphs

      t.timestamps
    end
  end
end
