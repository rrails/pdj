class Removefields < ActiveRecord::Migration
  def change
    remove_column :plats, :email
    remove_column :plats, :ready
  end
end
