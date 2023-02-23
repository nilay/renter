class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :unit, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.datetime :datetime
      t.text :note
      t.integer :status
      t.integer :interest_level
      t.timestamps
    end
  end
end
