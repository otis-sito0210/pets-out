class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :date
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
