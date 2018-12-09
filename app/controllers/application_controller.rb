class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  prepend_view_path Rails.root.join('app', 'javascript')

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
