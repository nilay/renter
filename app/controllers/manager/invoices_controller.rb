# frozen_string_literal: true

class Manager::InvoicesController < Manager::BaseController

  def index
    @invoices = Invoice.page(current_page)
  end

  def show
    @invoice = Invoice.find(params[:id])
  end
end