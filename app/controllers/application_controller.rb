class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:type, :first_name, :last_name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password) }
  end

end
