# frozen_string_literal: true

class Manager::DashboardController < Manager::BaseController
  def index
    @appointments = Appointment.order("id desc").take(10)
    @stats = ReportService.stats
  end
end