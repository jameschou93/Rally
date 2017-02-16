class AddDateToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :date, :string
  end
end
