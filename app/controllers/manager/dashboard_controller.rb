# frozen_string_literal: true

class Manager::DashboardController < Manager::BaseController
  def index
    render html: "<h1>Manager Dashboard</h1>"
  end
end