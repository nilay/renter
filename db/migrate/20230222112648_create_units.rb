class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.references :unit_type, foreign_key: true, null: false
      t.string :unit_no, index: {unique: true}, null: false
      t.decimal :monthly_rental_amount, precision: 10, scale: 2
      t.integer :status, index: true
      t.integer :sql_meter
      t.string :year_built



      t.timestamps
    end
  end
end
