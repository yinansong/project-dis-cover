class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You don't have access to do so."
    redirect_to root_url
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:name, :email, :avatar, :password, :password_confirmation, :crop_x, :crop_y, :crop_w, :crop_h)
      end
      devise_parameter_sanitizer.for(:sign_in) do |u|
        u.permit(:name, :email, :password)
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:name, :email, :avatar, :password, :password_confirmation, :current_password, :crop_x, :crop_y, :crop_w, :crop_h)
      end
    end
end
