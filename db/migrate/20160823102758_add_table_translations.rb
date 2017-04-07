class AddTableTranslations < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        Admin::Product.create_translation_table!({
          :name => :string,
          :description => :string
        }, {
          :migrate_data => true
        })
      end

      dir.down do 
        Admin::Product.drop_translation_table! :migrate_data => true
      end
    end
  end
end
