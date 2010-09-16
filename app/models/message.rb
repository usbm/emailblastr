class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :reply_to
  has_many :message_deliveries
  
  validates_presence_of :name, :from_name, :subject, :reply_to_id
end
