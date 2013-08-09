require 'spec_helper'

describe UsersController do
  describe 'Sign Up' do
    before do
      post :create, { :user => {:name  => "Joe", :password => "a", :password_confirmation => "a"}}
    end

    it "should create a new user" do
      expect(assigns(:user).name).to eq("Joe")
      (:user).should_not be_nil
    end

    it "should redirect to the edit user" do
      expect(response.status).to eq(302)
      expect(response).to(redirect_to(edit_user_path(assigns(:user))))
    end
  end

  describe 'Get all' do
    before do
      get :index
    end

    it 'should respond with a status 200' do
      expect(response).to be_success
      expect(response).to render_template("index")
    end
  end

  describe 'Get Edit' do
    before do
      get :edit
    end

    it 'should respond with a status 200' do
      expect(response).to eq(302)
      expect(response).to render_template("edit")
    end
  end

  describe 'Edit Profile' do
    before do
      @cuser = User.create(:name => 'Pear', :password => "a", :password_confirmation => "a")
      @user = User.find(@cuser.id)
    end

    # let(:user)  {User.find user.id}

    it "should find the user" do
      @user.id.should_not be_nil
      @user.name == "Pear"
    end

    it "should update the user" do
      put :update, {:id => @user.id, :user =>{ :address  => "123"}}
      @user.reload
      @user.address.should eq("123")
    end

    it "should redirect the user to restaurant finder" do
      put :update, {:id => @user.id, :user =>{ :address  => "123"}}
      @user.reload
      expect(response.status).to eq(302)
      expect(response).to(redirect_to(restaurants_path))
    end
  end

  describe 'User logoff' do
    before do
      @user = User.create(:name => 'Pear', :password => "a", :password_confirmation => "a")
    end
    pending
  end

end