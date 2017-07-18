class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_tweet

  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction,:nickname, :avatar, :wallpaper])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction,:nickname, :avatar, :wallpaper])
  end

  private

  def set_tweet
    @tweet = current_user.tweets.new if user_signed_in?
  end
end
