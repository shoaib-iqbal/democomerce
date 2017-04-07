class AddAttachmentAvatarToAdminProducts < ActiveRecord::Migration
  def self.up
    change_table :admin_products do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :admin_products, :avatar
  end
end
