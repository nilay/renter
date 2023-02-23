# == Schema Information
#
# Table name: invoice_items
#
#  id         :bigint           not null, primary key
#  amount     :decimal(10, 2)
#  item_type  :integer
#  vat_amount :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  invoice_id :bigint           not null
#
# Indexes
#
#  index_invoice_items_on_invoice_id  (invoice_id)
#
# Foreign Keys
#
#  fk_rails_...  (invoice_id => invoices.id)
#
class InvoiceItem < ApplicationRecord
  extend Enumerize
  belongs_to :invoice

  enumerize :item_type, in: {
    monthly_rent: 1,
    service_charge: 2,
    maintenance_charge: 3
  }
end
