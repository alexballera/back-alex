class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
 
def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
end

def default_url_options(options={})
  { locale: I18n.locale }
end

protected

  def authenticate_asistant!
    redirect_to root_path, alert: "Lo siento! No estás autorizado para realizar esta acción" unless user_signed_in? && current_user.is_asistant?
  end

  def authenticate_admin!
    redirect_to root_path, alert: "Lo siento! No estás autorizado para realizar esta acción" unless user_signed_in? && current_user.is_admin?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :name, :password, :current_password) }
  end
end
