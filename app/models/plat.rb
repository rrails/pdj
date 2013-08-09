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

class Plat < ActiveRecord::Base
  attr_accessible :description, :price, :date, :email, :ready, :release,:image, :restaurant_id,:avatar
  belongs_to :restaurant
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates :release, :presence => true
  validates :restaurant_id, :presence => true

end
