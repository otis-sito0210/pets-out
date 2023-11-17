class ModifyActivities < ActiveRecord::Migration[7.0]
  def change
    # Remove the 'date' column
    remove_column :activities, :date, :integer

    # Add new columns
    add_column :activities, :title, :string
    add_column :activities, :subtitle, :string
    add_column :activities, :address, :string
  end
end
