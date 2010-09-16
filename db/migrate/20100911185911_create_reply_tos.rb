class CreateReplyTos < ActiveRecord::Migration
  def self.up
    create_table :reply_tos do |t|
      t.integer :user_id
      t.string :email
      t.boolean :confirmed
      t.boolean :active
      t.string :secret

      t.timestamps
    end
    
    add_index :reply_tos, :confirmed
    add_index :reply_tos, :active
    add_index :reply_tos, :user_id
  end

  def self.down
    drop_table :reply_tos
  end
end
