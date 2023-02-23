class CreateInvoiceItems < ActiveRecord::Migration[7.0]
  def change
    create_table :invoice_items do |t|
      t.references :invoice, foreign_key: true, null: false
      t.integer :item_type
      t.decimal :amount, precision: 10, scale: 2
      t.decimal :vat_amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end
