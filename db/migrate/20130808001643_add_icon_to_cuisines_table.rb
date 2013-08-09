class AddIconToCuisinesTable < ActiveRecord::Migration
  def change
    add_column :cuisines, :icon, :string
  end
end
