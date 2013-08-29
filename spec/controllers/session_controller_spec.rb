require 'spec_helper'

describe SessionController do
  describe 'Sign Up Session' do
    before do
      @user = User.create(:name => 'Lego', :password => "a", :password_confirmation => "a")
      post :create, {:name  => "Lego", :password => "a"}
    end

  it 'should respond with a status 200' do
      # expect(response).to be_success
      expect(response.status).to eq(302)
    end

  # describe 'delete a session' do
  #   before do
  #     @user = User.create(:name => 'Lego', :password => "a", :password_confirmation => "a")
  #     post :create, {:name  => "Lego", :password => "a"}
  #   end

  # it 'should respond with a status 200' do
  #     # expect(response).to be_success
  #     expect(response.status).to eq(302)
  #   end
  end
end

