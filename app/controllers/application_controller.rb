class ApplicationController < ActionController::Base

  def after_sign_in_path_for(user)
    puts "===========", user.email, "==============="
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
