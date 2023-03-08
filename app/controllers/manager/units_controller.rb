# frozen_string_literal: true

class Manager::UnitsController < Manager::BaseController

  def index
    @units = Unit.page(current_page)
  end

  def show
    @unit = Unit.find(params[:id])
  end
end