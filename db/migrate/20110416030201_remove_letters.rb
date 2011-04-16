class RemoveLetters < ActiveRecord::Migration
  def self.up
    drop_table :letters
  end

  def self.down
    create_table :letters do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
    
  end
end
