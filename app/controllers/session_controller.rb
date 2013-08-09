class SessionController < ApplicationController

  def create
    user = User.where(:name => params[:name]).first
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      # Redirect based on type of user logged on
      if (user.is_a?(Restaurant))
        redirect_to(plats_path)
      else
        redirect_to(restaurants_path)
      end
    else
      redirect_to(root_path)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end
end