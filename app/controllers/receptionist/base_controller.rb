# frozen_string_literal: true

class Receptionist::BaseController < ApplicationController
  before_action :assert_role


  private
  def assert_role
    # todo: redirect if user is not manager
  end
end