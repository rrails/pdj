class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  def ensure_logged_in
    redirect_to(root_path) if @current_user.nil?
  end

  private
  def authenticate
    return unless session[:user_id]
    @current_user = User.find_by_id(session[:user_id])
    unless @current_user
    session[:user_id] = nil
    redirect_to root_url
    end
  end
end
