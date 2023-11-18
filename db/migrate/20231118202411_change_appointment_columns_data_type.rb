class ChangeAppointmentColumnsDataType < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :date, :integer
    remove_column :appointments, :hour, :integer

    add_column :appointments, :date, :date
    add_column :appointments, :hour, :time
  end
end
