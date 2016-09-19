class Addcoltostore < ActiveRecord::Migration
  def change
  	add_column :stores , :facebook_link ,:string
  	add_column :stores , :twitter_link ,:string
  	add_column :stores , :pintrest_link ,:string
  	add_column :stores , :google_link ,:string
  	add_column :stores , :youtube_link ,:string
  	add_column :stores , :contact_email ,:string
  	add_column :stores , :contact_address ,:string
  end
end
