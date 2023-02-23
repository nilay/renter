# frozen_string_literal: true

class Renter::DashboardController < Renter::BaseController
  def index
    render html: "<h1>Renter Dashboard</h1>"
  end
end