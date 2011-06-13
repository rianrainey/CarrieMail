class AddPackageChoiceToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :package_choice, :integer
  end

  def self.down
    remove_column :users, :package_choice
  end
end
