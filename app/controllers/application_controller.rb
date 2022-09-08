# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
    I18n.locale = 'es'
  end

  protected

  def after_sign_up_path_for(_resource)
    if resource.seller? 
      edit_user_registration_path
    else  
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :birthdate, :phone, :active_role, :role)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password, :password_confirmation, :birthdate, :phone, :active_role,
               :role)
    end
  end
end
