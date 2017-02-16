class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :title
      t.integer :location_id
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
