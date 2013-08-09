require 'spec_helper'
require 'capybara'

describe PlatsController do
  describe 'Index - Get all the plats for a particular user' do
    before do
      @restaurant = Restaurant.create(:name => 'Pear', :password => "a", :password_confirmation => "a")
      request.session[:user_id] = @restaurant.id

      @plat1 = Plat.create(:description  => "Soup", :price => "10.00", :release => "2013-08-08", :restaurant_id => @restaurant.id)
      @plat2 = Plat.create(:description  => "Curry", :price => "15.00", :release => "2013-08-08",:restaurant_id => @restaurant.id)
      @plat3 = Plat.create(:description  => "Pad Thai", :price => "20.00", :release => "2013-08-08",:restaurant_id => @restaurant.id)
    end

    describe 'as HTML' do
      before do
        get :index
      end

      it 'should respond with a status 200' do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it 'should give the plats in an instance variable' do
        expect(assigns(:plats)).to be
        expect(Plat.count).to eq(3)
        expect(assigns(:plats).first.class).to eq(Plat)
        expect(assigns(:plats).first.description).to eq("Soup")
      end

      it "should render the index template" do
        expect(response).to render_template("index")
      end
    end
  end

  describe 'POST to create' do
    describe 'a plat with valid informaton' do
      before do
        @restaurant = Restaurant.create(:name => 'Pear', :password => "a", :password_confirmation => "a",:address =>'123 Surrey Hills')
        request.session[:user_id] = @restaurant.id
        post :create, { :plat => {:description  => "Pizza", :price => "17.00", :release => "2013-08-09" }}
      end

      it "should redirect to the plats page" do
        expect(response.status).to eq(302)
        # expect(response).to render_template("plats")
        expect(response).to(redirect_to(plats_path))
      end

    end

    describe 'a plat without a price' do
      before do
        @restaurant = Restaurant.create(:name => 'Pear', :password => "a", :password_confirmation => "a")
        request.session[:user_id] = @restaurant.id
        post :create, { :plat => {:description  => "Pizza", :release => "2013-08-09" }}
      end

      it "should be created successfully" do
        expect(response.status).to eq(302)
        expect(assigns(:plat).description).to eq("Pizza")
      end

      it "should render the plats template" do
        expect(response).to render_template("plats")
      end
    end

  end
  describe 'Edit to update' do
     # before do
     #    @restaurant = Restaurant.create(:name => 'Pear', :password => "a", :password_confirmation => "a")
     #    request.session[:user_id] = @restaurant.id
     #    post :create, { :plat => {:description  => "Pizza", :price => "17.00", :release => "2013-08-09" }
     #    @restaurant.plats << (assigns(:plat))
     #    @restaurant.save
     #  end
  end
  describe 'describe' do
         # before do
     #    @restaurant = Restaurant.create(:name => 'Pear', :password => "a", :password_confirmation => "a")
     #    request.session[:user_id] = @restaurant.id
     #    post :create, { :plat => {:description  => "Pizza", :price => "17.00", :release => "2013-08-09" }
     #    @restaurant.plats << (assigns(:plat))
     #    @restaurant.save
     #  end
  end

end



