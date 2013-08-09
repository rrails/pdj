# spec/support/spec_test_helper.rb
module SpecTestHelper
  def login_admin
    login(:admin)
  end

  def login(user)
    user = User.where(:login => user.to_s).first if user.is_a?(Symbol)
    request.session[:user] = user.id
  end

  def current_user
    User.find(request.session[:user])
  end
end

# spec/spec_helper.rb
RSpec.configure do |config|
  config.include SpecTestHelper, :type => :controller
end

# def create
#     user = User.where(:name => params[:name]).first
#     if user.present? && user.authenticate(params[:password])
#       session[:user_id] = user.id
#       if (user.is_a?(Restaurant))
#         redirect_to(plats_path)
#       else
#         redirect_to(restaurants_path)
#       end
#     else
#       redirect_to(root_path)
#     end
#   end

