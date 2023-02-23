class CreateUnitTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :unit_types do |t|
      t.string :name, null: false, index: {unique: true}
      t.text :description
      t.integer :unit_count, default: 0
      t.integer :use_type

      t.timestamps
    end
  end
end
