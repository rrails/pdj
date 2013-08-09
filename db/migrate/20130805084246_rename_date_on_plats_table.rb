class RenameDateOnPlatsTable < ActiveRecord::Migration
  def change
    add_column :plats, :release, :datetime
    remove_column :plats, :date
  end
end


