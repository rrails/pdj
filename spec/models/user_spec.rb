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
      @user = User.new
  end

    # it "has invalid name" do
    #   @user.valid?.should be_false
    # end

    # it "has a valid name" do
    #   @user.name = "Lego"
    #   # @user.address = "108 Harris Street"
    #   # @user.phone = "043499123"
    #   # @user.email = "Lego@gmail.com"
    #   @user.valid?.should be_true
    # end
end
