# frozen_string_literal: true

class Manager::LeasesController < Manager::BaseController

  def index
    @leases = Lease.page(current_page)
  end

  def show
    @lease = Lease.find(params[:id])
  end
end