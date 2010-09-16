class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.integer :user_id
      t.string :name
      t.text :confirmation_text
      t.string :from_email_slug, :unique => true
      t.text :description

      t.timestamps
    end
    
    add_index :lists, :user_id
    add_index :lists, :from_email_slug, :unique => true
  end

  def self.down
    drop_table :lists
  end
end
