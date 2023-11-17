class AddDetailsToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :places, :title, :string
    add_column :places, :subtitle, :string
    add_column :places, :address, :string
    add_column :places, :pricing, :decimal
    add_column :places, :rooms, :integer
    add_column :places, :details, :text
  end
end
