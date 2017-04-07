class ChangeColorLanguage < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        Admin::Color.create_translation_table!({
          :name => :string,
          :value => :string
        }, {
          :migrate_data => true
        })
      end

      dir.down do 
        Admin::Color.drop_translation_table! :migrate_data => true
      end
    end
  end
end
