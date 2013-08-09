require 'spec_helper'

describe RestaurantsController do
  describe 'Restaurants home page' do
      before do

      thai = Cuisine.create(:name => 'thai', :icon => 'http://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/32/Thailand-Flag-icon.png')

      @restaurant = Restaurant.create(:name => 'Lego House', :address => '700 Harris St Sydney', :phone => '0422222', :email => 'lego@gmail.com', :password => 'a', :city => 'Sydney', :password_confirmation => 'a', :cuisine_id => thai.id)
      request.session[:user_id] = @restaurant.id

      @plat1 = Plat.create(:description => '2 Piri Piri Burgers with fries', :price => '20', :release => '2013-08-07 11:00', :email => 'rockpool@gmail.com', :ready => true, :image => 'http://www.healthyfood.co.nz/sites/default/files/styles/recipe_320x295/public/recipeimages/5723.jpg', :restaurant_id => @restaurant.id)
      @plat2 = Plat.create(:description => 'All you can eat Sushi', :price => '25', :release => '2013-08-07', :email => 'rockpool@gmail.com', :ready => true , :image => 'http://thetased.files.wordpress.com/2010/09/sushi2.jpg', :restaurant_id => @restaurant.id)
      @plat3 = Plat.create(:description => 'Pork Buns', :price => '10', :release => '2013-08-07', :email => 'hut@gmail.com', :ready => true, :image => 'http://www.foodpeoplewant.com/wp-content/uploads/2009/11/Barbecued-Pork-Buns-1024x768.jpg', :restaurant_id => @restaurant.id)
    end

    describe 'as HTML' do
      before do
        get :index
    end

     it 'should respond with a status 200' do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'should give an instance variable called restaurants' do
      expect(assigns(@restaurants)).to be
    end

    it "should render the index template" do
        expect(response).to render_template("index")
    end
end


  it 'should be able to access all the plats from the restaurant controller' do
      expect(assigns(@plats)).to be
    end

    it "should not get plats older than yesterday at 11am" do
      expect(assigns(@plats.first.release)).to be > Time.new(2013, 8, 7, 11, 0 ,0)
    end

  #   it "should get the plats cusine names" do
  #   expect(:name).to eq('Thai')
  # end



    # it "should not get plats newer than today at 11am" do
    #   expect(assigns(:release)).to be < (Time.new(2013, 8, 8, 11, 0 ,0)
    # end


    # describe '#search' do

    #   it 'should return results from ' do

 describe 'as edit' do
      before do
        get :edit
    end

    it "should render the edit form" do
      response.should render_template("edit")
    end





    end
  end
end

