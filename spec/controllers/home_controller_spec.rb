require 'spec_helper'

describe HomeController do
  describe 'Home Page' do
    before do
      get :index
    end

    it 'should respond with a status 200' do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "should render the sign up template" do
      render_template(:partial => "signup")
      expect(response).to render_template("index")
    end
  end
end