class PlatsController < ApplicationController
  before_filter :ensure_logged_in

  def index
    @plats = @current_user.plats
  end

  def new
    @plat=Plat.new
  end

  def edit
    @plat=Plat.find(params[:id])
  end

  def update
    @plat=Plat.find(params[:id])
    if (params[:img_delete])
      @plat.avatar = nil
    end
    @plat.update_attributes(params[:plat])
    @plat.price = @plat.price || 0
    redirect_to(plats_path)
  end

  def create
    @plat=Plat.new(params[:plat])
    @plat.restaurant = @current_user
    @plat.save
    # plat belongs to a user
    #@current_user.plats << @plat
    #@current_user.save
    redirect_to(plats_path)
  end

  def destroy
    plat = Plat.find(params[:id])
    plat.destroy
    redirect_to(plats_path)
  end
end