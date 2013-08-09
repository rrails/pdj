class AddUsersTable < ActiveRecord::Migration
    def change
    create_table :users do |t|
      t.string :type
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :image
      t.string :city
      t.float  :longitude, :default => 0
      t.float  :latitude, :default => 0
      t.string :password_digest
      t.timestamps
    end
  end
end
