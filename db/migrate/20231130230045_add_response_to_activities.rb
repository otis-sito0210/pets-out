class AddResponseToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :response, :text
  end
end
