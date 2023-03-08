class ApplicationController < ActionController::Base
  skip_forgery_protection

  def current_page
    params[:page] || 1
  end

  def after_sign_in_path_for(user)
    case user
    when User.role.manager
      manager_root_path
    when User.role.receptionist
      receptionist_root_path
    when User.role.renter
      renter_root_path
    else
      unauthenticated_root_path
    end
  end
end
