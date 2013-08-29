# require 'spec_helper'

describe RestaurantsController do
  describe 'Restaurants home page' do
    before do

      thai = Cuisine.create(:name => 'thai', :icon => 'http://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/32/Thailand-Flag-icon.png')

      @restaurant = Restaurant.create(:name => 'Lego House', :address => '700 Harris St Sydney', :phone => '0422222', :email => 'lego@gmail.com', :password => 'a', :city => 'Sydney', :password_confirmation => 'a', :cuisine_id => thai.id)
      request.session[:user_id] = @restaurant.id

      @plat1 = Plat.create(:description => '2 Piri Piri Burgers with fries', :price => '20', :release => '2013-08-07 11:00', :restaurant_id => @restaurant.id)
      @plat2 = Plat.create(:description => 'All you can eat Sushi', :price => '25', :release => '2013-08-07', :restaurant_id => @restaurant.id)
      @plat3 = Plat.create(:description => 'Pork Buns', :price => '10', :release => '2013-08-07', :restaurant_id => @restaurant.id)
    end

    describe 'as HTML' do
      before do
        get :index
      end

      it 'should respond with a status 200' do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

    it "should render the index template" do
        expect(response).to render_template("index")
    end

    end

  end

  describe 'restaurant' do
    before do
      @restaurant = Restaurant.create(:name => 'Lego', :password => "a", :password_confirmation => "a")
      request.session[:user_id] = @restaurant.id
    end

    it 'edit should respond with a status 200' do
      get :edit,id: @restaurant.id
      expect(response.status).to eq(200)
      expect(response).to render_template("edit")
    end

    it 'email should be update to Lego@gmail.com' do
      put :update,:id => @restaurant.id ,:restaurant => { :address => '112 Harris Street,Sydney', :email => 'lego@gmail.com'}
      @updatedrestaurant = Restaurant.find(@restaurant.id)
      @updatedrestaurant.email.should eq('lego@gmail.com')
    end
  end

  describe 'search' do
    describe 'a restaurant' do
      before do
        post :search, :location => '112 Harris Street,Sydney'
      end

      it 'should respond with a JSON message' do
  #       expect(response.status).to eq(302)
      end
    end
  end

  describe 'create' do
    describe 'a restaurant' do
      before do
        post :create, {:user=>{:name => 'Lego', :password => "a", :password_confirmation => "a"}}
      end

      it 'should create a restaurant' do
        expect(response.status).to eq(302)
      end
    end
  end



end

