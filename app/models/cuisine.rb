# == Schema Information
#
# Table name: cuisines
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  icon       :string(255)
#

class Cuisine < ActiveRecord::Base
  attr_accessible :name, :icon
  has_many :restaurants
end
