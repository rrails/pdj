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

class User < ActiveRecord::Base
  has_secure_password
  before_save :geocode ##before we do anything runs the geocode

  attr_accessible :name, :address, :phone, :email, :image, :city, :password, :password_confirmation, :icon, :cuisine_id,:avatar

  validates :name, :presence => true


  private
  def geocode
    result = Geocoder.search(self.address).first

    if result.present?
        self.latitude = result.latitude #set latitude and longitude to our model before we save, whenever they enter an address
        self.longitude = result.longitude
      end
    end
end
