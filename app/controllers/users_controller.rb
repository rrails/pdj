class UsersController < ApplicationController
  def edit
    @user=User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    redirect_to(restaurants_path)
  end

  def create
    @user = User.create(params[:user])
    @current_user = @user
    session[:user_id] = @user.id
    respond_to do |format|
      format.html {redirect_to(edit_user_path(@user))}
      format.json {render :json => {url: (edit_user_path(@user))}}
    end
  end
end
