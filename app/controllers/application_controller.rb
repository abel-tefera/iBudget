class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :password, :password_confirmation)
    end
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to splash_screen_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = 'You are not authorized to perform this task'
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, alert: exception.message }
    end
  end
end
