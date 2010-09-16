class CreateSubscribers < ActiveRecord::Migration
  def self.up
    create_table :subscribers do |t|
      t.integer :list_id
      t.boolean :confirmed
      t.boolean :unsubscribed
      t.string :name_prefix
      t.string :first_name
      t.string :last_name
      t.string :name_suffix
      t.string :business_name
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :phone
      t.string :fax
      
      t.string :secret

      t.timestamps
    end
    
    add_index :subscribers, :list_id
    add_index :subscribers, :confirmed
    add_index :subscribers, :unsubscribed
  end

  def self.down
    drop_table :subscribers
  end
end
