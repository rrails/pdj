class RemoveIconFromUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :icon
  end
end
