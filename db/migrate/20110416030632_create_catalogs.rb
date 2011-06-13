# associates users with correspondence 

class CreateCatalogs < ActiveRecord::Migration
  def self.up
    create_table :catalogs do |t|
      t.column :user_id, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :catalogs
  end
end
