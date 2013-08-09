class AddPdjsTable < ActiveRecord::Migration
  def change
    create_table :pdjs do |t|
      t.string   :description
      t.integer  :price
      t.datetime :date
      t.string   :email
      t.boolean  :ready
      t.timestamps
    end
  end
end
