class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def check_counselor
    unless current_user.is_counselor
      flash[:notice] = "no way"
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource.is_counselor
      students_path
    elsif !resource.is_counselor && resource.sign_in_count== 1
      edit_user_registration_path
    else
      college_apps_path
    end
  end
end
