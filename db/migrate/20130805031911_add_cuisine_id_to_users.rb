class AddCuisineIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cuisine_id, :integer
  end
end
