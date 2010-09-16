class MessageDelivery < ActiveRecord::Base
  belongs_to :subscriber
  belongs_to :message
  
  validates_presence_of :subscriber_id, :message_id
end
