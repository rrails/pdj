# == Schema Information
#
# Table name: plats
#
#  id                  :integer          not null, primary key
#  description         :string(255)
#  price               :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  restaurant_id       :integer
#  release             :datetime
#  image               :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

require 'spec_helper'

describe Plat do
  before do
    @restaurant = Restaurant.create(:name => 'Lego', :password => "a", :password_confirmation => "a")
  end

  it { should belong_to :restaurant }

  it "should have an id " do
    plat = Plat.create(:description => 'Pad Thai', :price => '12.00', :release => '2013-08-08',:restaurant_id => @restaurant.id)
    plat.id.should_not be_nil
    plat.description.should == 'Pad Thai'
  end

  it "should belong to Lego restaurant " do
    plat = Plat.create(:description => 'Pad Thai', :price => '12.00', :release => '2013-08-08',:restaurant_id => @restaurant.id)
    plat.restaurant.name.should == 'Lego'
    plat.restaurant_id.should_not be_nil
  end

  it "should be associated with a restaurant" do
      plat = Plat.create(:description => 'soup', :restaurant_id => @restaurant.id)
      plat.restaurant_id.should_not be_nil
  end

  it "cannot save without release date" do
    plat = Plat.new(:description => 'soup', :price => '10.00', :restaurant_id => @restaurant.id)
    plat.save.should be_false
  end

  it "should not create without a release date" do
    plat = Plat.create(:description => 'soup', :price => '10.00',:restaurant_id => @restaurant.id)
    plat.id.should be_nil
  end
end


