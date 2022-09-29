# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
    I18n.locale = 'es'
  end

  protected

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "No puedes acceder a esta página"
  end

  def after_sign_in_path_for(_resource)
    if current_user.seller? and current_user.commerces.size < 1
      new_user_commerce_path(current_user)
    else  
      root_path
    end
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :birthdate, :phone, :active_role, :role, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password, :password_confirmation, :birthdate, :phone, :active_role,
               :role)
    end
  end
end
