class CreateLeases < ActiveRecord::Migration[7.0]
  def change
    create_table :leases do |t|
      t.references :unit, foreign_key: true, null: false
      t.references :renter, foreign_key: {to_table: 'users'}
      t.date :from_date, null: false
      t.date :to_date, null: false
      t.integer :status, index: true
      t.references :leased_by, foreign_key: {to_table: 'users'}

      t.timestamps
    end
  end
end
