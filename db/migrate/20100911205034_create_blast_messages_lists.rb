class CreateBlastMessagesLists < ActiveRecord::Migration
  def self.up
    create_table :blast_messages_lists, :id => false do |t|
      t.references :blast_message, :list
    end
    add_index :blast_messages_lists, :blast_message_id
    add_index :blast_messages_lists, :list_id
  end

  def self.down
    drop_table :blast_messages_lists
  end
end
