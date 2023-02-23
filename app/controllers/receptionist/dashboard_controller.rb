# frozen_string_literal: true

class Receptionist::DashboardController < Receptionist::BaseController
  def index
    render html: "<h1>Receptionist Dashboard</h1>"
  end
end