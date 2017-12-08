class ApplicationController < ActionController::Base
  
  # 모바일 기계 식별 메소드
  helper_method :mobile?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :description, :description_permission, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :description, :description_permission, :email, :password, :current_password])
  end
  
  # 모바일 기계 식별
  private
  def mobile? # has to be in here because it has access to "request"
    request.user_agent =~ /\b(Android|iPhone|iPad|Windows Phone|Opera Mobi|Kindle|BackBerry|PlayBook)\b/i
  end

end