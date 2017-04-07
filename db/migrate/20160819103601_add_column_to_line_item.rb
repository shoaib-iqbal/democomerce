class AddColumnToLineItem < ActiveRecord::Migration
  def change
  	add_column :line_items, :size_id, :integer
  end
end
