class ModifyAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :trip, foreign_key: true
    add_reference :appointments, :activity, foreign_key: true

    remove_reference :appointments, :user, foreign_key: true
    remove_reference :appointments, :place, foreign_key: true  
  end
end
