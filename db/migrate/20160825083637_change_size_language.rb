class ChangeSizeLanguage < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        Admin::Size.create_translation_table!({
          :name => :string,
          :value => :string
        }, {
          :migrate_data => true
        })
      end

      dir.down do 
        Admin::Size.drop_translation_table! :migrate_data => true
      end
    end
  end
end
