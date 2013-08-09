class RemoveCuisineFromUsersTable < ActiveRecord::Migration
  def up
    remove_column :users, :cuisine
  end

  def down
  end
end
