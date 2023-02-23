# frozen_string_literal: true

class ReportService
  def self.stats
    {
      appointment_count: Appointment.count,
      this_week_appointments: Appointment.where('datetime >= ?', 1.week.ago).count,
      invoice_amount: Invoice.sum(:amount_total),
      due_invoice_amount: Invoice.where('invoice_due_date <= ?', Date.today).sum(:amount_total),
      lease_count: Lease.count,
      running_lease_count: Lease.with_status(:running).count,
      unit_count: Unit.count,
      vacant_unit_count: Unit.with_status(:vacant).count
    }
  end
end