# == Schema Information
#
# Table name: invoices
#
#  id               :bigint           not null, primary key
#  amount_total     :decimal(10, 2)
#  invoice_date     :date
#  invoice_due_date :date
#  period_from      :date
#  period_to        :date
#  status           :integer
#  vat_total        :decimal(10, 2)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  lease_id         :bigint           not null
#
# Indexes
#
#  index_invoices_on_invoice_date  (invoice_date)
#  index_invoices_on_lease_id      (lease_id)
#
# Foreign Keys
#
#  fk_rails_...  (lease_id => leases.id)
#
class Invoice < ApplicationRecord
  belongs_to :lease
  has_many :invoice_items

  accepts_nested_attributes_for :invoice_items
end
