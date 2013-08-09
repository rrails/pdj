class AddAttachmentAvatarToPlats < ActiveRecord::Migration
  def self.up
    change_table :plats do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :plats, :avatar
  end
end
