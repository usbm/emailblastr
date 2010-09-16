class AddAutoresponderFieldsToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :days_to_wait, :integer
    add_column :messages, :active, :boolean
  end

  def self.down
    remove_column :messages, :active
    remove_column :messages, :days_to_wait
  end
end
