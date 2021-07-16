class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_kana, :last_kana, :birthday, :shop_name, :shop_text, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :image])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'taiki' && password == '1456'
    end
  end
end