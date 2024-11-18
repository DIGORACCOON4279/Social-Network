
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permite el parámetro :name en el registro (sign_up)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # Si también quieres permitir :name en la edición del perfil
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
