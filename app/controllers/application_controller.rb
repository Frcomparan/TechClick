# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :set_locale

  def set_locale
    I18n.locale = 'es'
  end

  protected
  def after_sign_in_path_for(resource)
    root_path
  end
end
