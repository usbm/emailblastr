require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase
  should validate_presence_of :list_id
  should validate_presence_of :email
  
  should belong_to :list
  should have_many :message_deliveries
  
  setup do
    @subscriber = Factory(:subscriber)
  end
  
  should "generate a secret after create" do
    assert !@subscriber.secret.blank?
  end
  
  teardown do
    Subscriber.delete_all
    List.delete_all
    User.delete_all
  end
end
