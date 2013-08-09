class RenamePdjsToPlats < ActiveRecord::Migration
  def change
    rename_table :pdjs, :plats
  end
end
