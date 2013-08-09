class RestaurantsController < ApplicationController
  # before_filter :ensure_logged_in #calls from application controller code to ensure you redirect home when not logged in (instead of an error)
  def index
    @restaurants = Restaurant.all
    @plats = Plat.where('release > ? AND release < ?' , 1.day.ago.change(:hour => 11), Time.now.change(:hour => 11))
    @platscuisine = @plats.map{ |x| x.restaurant.cuisine.name }.uniq
  end

  def edit
    @restaurant=Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    # delete the images
    if (params[:img_delete])
      @restaurant.avatar = nil
    end
    if @restaurant.update_attributes(params[:restaurant])
      redirect_to(restaurants_path)
    else
      # if there are errors updating the attributes then redisplay the edit form
      render :edit
    end
  end

  def search
    result = Geocoder.search(params[:location]).first
    @lat = result.latitude #created a lat and long variable to pass back to the browser
    @long = result.longitude

    respond_to do |format|
      format.json{
        render :json => {
          :latitude => @lat,
          :longitude => @long,
        }
      }
    end
  end

  def create
    @restaurant = Restaurant.create(params[:user])
    @current_user = @restaurant
    session[:user_id] = @current_user.id

    respond_to do |format|
      format.html {redirect_to(edit_restaurant_path(@restaurant))}
      format.json {render :json => {url: (edit_restaurant_path(@restaurant))}}
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
    redirect_to(restaurants_path)
  end
end
