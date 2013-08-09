class AddImageToPlatsTable < ActiveRecord::Migration
  def change
    add_column :plats, :image, :string
  end
end
