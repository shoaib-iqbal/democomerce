class AddAttachmentToUser < ActiveRecord::Migration
  def change
  	add_attachment :users , :avatar
  end
end
