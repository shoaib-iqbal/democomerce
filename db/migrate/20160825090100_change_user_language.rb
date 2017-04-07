class ChangeUserLanguage < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        User.create_translation_table!({
          :name => :string,
          :location => :string
        }, {
          :migrate_data => true
        })
      end

      dir.down do 
        User.drop_translation_table! :migrate_data => true
      end
    end
  end
end
