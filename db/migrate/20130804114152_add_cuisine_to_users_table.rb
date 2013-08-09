class AddCuisineToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :cuisine, :string
  end
end
