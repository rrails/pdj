class AddRestaurantIdToPlatsTable < ActiveRecord::Migration
  def change
    add_column :plats, :restaurant_id, :integer
  end
end
