# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  type                :string(255)
#  name                :string(255)
#  address             :string(255)
#  phone               :string(255)
#  email               :string(255)
#  image               :string(255)
#  city                :string(255)
#  longitude           :float            default(0.0)
#  latitude            :float            default(0.0)
#  password_digest     :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  cuisine_id          :integer
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

require 'spec_helper'
describe Restaurant do
  it { should belong_to :cuisine}
  end

describe "A restaurant" do
    before do
      @cuisine = Cuisine.create(:name => 'Thai')
      @restaurant = Restaurant.create(:name => 'Legohouse', :address => '700 harris st Sydney', :phone => '12345678', :email => 'lego@lego.com', :image => 'http://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/32/Thailand-Flag-icon.png', :city => 'Sydney', :cuisine_id => @cuisine.id, :password => 'a', :password_confirmation => 'a')

    end


    it "should have a name" do
     @restaurant.name.should == 'Legohouse'
   end

   it "should have an address" do
    @restaurant.address.should == '700 harris st Sydney'
  end

  it "should have a phone number" do
    @restaurant.phone.should == '12345678'
  end

  it "should have an email" do
    @restaurant.email.should == 'lego@lego.com'
  end

  it "should have an image" do
    @restaurant.image.should == 'http://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/32/Thailand-Flag-icon.png'
  end

  it "should have a city" do
    @restaurant.city.should == 'Sydney'
  end

  it "should have a cuisine name" do
    @restaurant.cuisine.name == 'Thai'
  end

   it "should have a working password" do
    @restaurant.password == 'a'
  end

  it "should have a password confirmation" do
    @restaurant.password_confirmation == 'a'
  end


  it "should have geocoder pick up the longitude based on the address" do
    @restaurant.longitude.should == 151.2014587
  end

   it "should have geocoder pick up the latitude based on the address" do
    @restaurant.latitude.should == -33.8824992
  end
end



