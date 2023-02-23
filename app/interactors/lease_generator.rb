class LeaseGenerator
  include Interactor

  before do
    return context.fail!(error: 'Missing Unit') unless context.unit.present?
    return context.fail!(error: 'Missing Renter') unless context.renter.present?
    return context.fail!(error: 'Missing Manager') unless context.leased_by.present?
    return context.fail!(error: 'Missing From Date') unless context.from_date.present?
    return context.fail!(error: 'Missing To Date') unless context.to_date.present?
  end

  def call
    if lease = Lease.create({
                   unit: context.unit,
                   renter: context.renter,
                   leased_by: context.leased_by,
                   from_date: context.from_date,
                   to_date: context.to_date,
                   status: :running
                 })
      lease.unit.update(status: :leased)
      create_invoice(lease)
      context.response = lease
    else
      context.fail!(error: context.lease.errors.full_messages.join(', '))
    end

  end

  private

  def create_invoice (lease)
    amount = lease.unit.monthly_rental_amount
    vat_amount = lease.unit.monthly_rental_amount * (18.0 / 100.0)
    inv_dates = invoice_dates(lease.from_date, lease.to_date)
    inv_dates.each do |date|
            lease.invoices.create({
                                      invoice_date: date,
                                      invoice_due_date: date + 15.days,
                                      period_from: date,
                                      period_to: date + 30.day,
                                      amount_total: amount,
                                      vat_total: vat_amount,
                                      invoice_items_attributes: [{item_type: :monthly_rent, amount: amount, vat_amount: vat_amount}]
                                    })
    end
  end

  def invoice_dates(from_date, to_date)
    dates = []
    while from_date < to_date
      dates << from_date
      from_date += 1.month
    end
    dates
  end

end
