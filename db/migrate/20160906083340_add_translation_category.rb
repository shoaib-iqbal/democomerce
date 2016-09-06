class AddTranslationCategory < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        Admin::Category.create_translation_table!({
          :name => :string,
          
        }, {
          :migrate_data => true
        })
      end

      dir.down do 
        Admin::Category.drop_translation_table! :migrate_data => true
      end
    end
  end
end