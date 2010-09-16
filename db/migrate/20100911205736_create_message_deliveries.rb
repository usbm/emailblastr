class CreateMessageDeliveries < ActiveRecord::Migration
  def self.up
    create_table :message_deliveries do |t|
      t.integer :message_id
      t.integer :subscriber_id

      t.timestamps
    end
    add_index :message_deliveries, :message_id
    add_index :message_deliveries, :subscriber_id
  end

  def self.down
    drop_table :message_deliveries
  end
end
