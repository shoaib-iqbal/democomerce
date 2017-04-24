class AddColumnCityToSubscriber < ActiveRecord::Migration
  def change
  	add_column :newsletter_subscribers, :city,:string
  end
end
