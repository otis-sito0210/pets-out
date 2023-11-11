class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :date
      t.string :details
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
