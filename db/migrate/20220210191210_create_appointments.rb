class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
