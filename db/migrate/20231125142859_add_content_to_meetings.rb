class AddContentToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :content, :string
  end
end
