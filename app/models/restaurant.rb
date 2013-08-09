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

class Restaurant < User
  has_many :plats
  belongs_to :cuisine
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates :address, :presence => true, :on => :update

end

def Restaurant.with_cuisine
  Restaurant.where('cuisine_id IS NOT null')
end


# delegate :cuisine_id, :to => :restaurant, prefix => true, :allow_nil => true
