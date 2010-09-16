class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :user_id
      t.string :name
      t.string :subject
      t.text :html_message
      t.text :plain_text_message
      t.datetime :delivered_at
      t.boolean :delivered
      t.string :type
      t.integer :list_id
      t.string :from_name
      t.integer :reply_to_id

      t.timestamps
    end
    add_index :messages, :user_id
    add_index :messages, :list_id
    add_index :messages, :reply_to_id
    add_index :messages, :type
    add_index :messages, :delivered
    add_index :messages, :delivered_at
  end

  def self.down
    drop_table :messages
  end
end
