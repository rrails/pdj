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

describe User do
  before do
    user = User.create(:name => 'Sam', :address => '700 harris st Sydney', :phone => '12345678', :email => 'sam@hotmail.com', :image => 'http://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/32/Thailand-Flag-icon.png', :city => 'Sydney',  :password => 'a', :password_confirmation => 'a')
  end
  it "should have an id " do
    user.id.should_not be_nil
  end

  it "should have a name" do
    user.name.should == 'Sam'
  end

  it "should have an address" do
    user.address.should == '700 harris st Sydney'
  end

  it "should have a phone number" do
    user.phone.should == '12345678'
  end

  it "should have an email" do
    user.email.should == 'sam@hotmail.com'
  end

  it "should have an image" do
    user.image.should == 'http://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/32/Thailand-Flag-icon.png'
  end

  it "should have geocoder pick up the longitude based on the address" do
    user.longitude.should == 151.2014587
  end

   it "should have geocoder pick up the latitude based on the address" do
    user.latitude.should == -33.8824992
  end
end