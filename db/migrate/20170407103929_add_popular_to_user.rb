class AddPopularToUser < ActiveRecord::Migration
  def change
  	add_column :users, :popular, :boolean
  end
end
