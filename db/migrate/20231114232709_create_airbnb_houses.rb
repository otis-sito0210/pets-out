class CreateAirbnbHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :airbnb_houses do |t|
      t.string :image_url
      t.text :title
      t.text :subtitle
      t.text :bed_count
      t.decimal :pricing
      t.integer :rating
      t.boolean :pet_friendly

      t.timestamps
    end
  end
end
