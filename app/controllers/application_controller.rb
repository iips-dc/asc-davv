class ApplicationController < ActionController::Base
  protect_from_forgery
  alias_method :current_user, :current_admin
  
  def after_sign_in_path_for(resource)
    admin_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

end




