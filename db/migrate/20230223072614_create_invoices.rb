class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.references :lease, foreign_key: true, null: false
      t.date :invoice_date, index: true
      t.date :invoice_due_date
      t.date :period_from
      t.date :period_to
      t.integer :status
      t.decimal :amount_total, precision: 10, scale: 2
      t.decimal :vat_total, precision: 10, scale: 2

      t.timestamps
    end
  end
end
