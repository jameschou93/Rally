class CreateAddDateToAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :add_date_to_appointments do |t|
      t.string :date

      t.timestamps
    end
  end
end
