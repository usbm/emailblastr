require 'test_helper'

class ReplyToTest < ActiveSupport::TestCase
  should belong_to :user
  should have_many :messages
  
  should validate_presence_of :email
  
  setup do
    @reply_to = Factory(:reply_to)
  end
  
  should "generate a secret after create" do
    assert !@reply_to.secret.blank?
  end
  
  teardown do
    @reply_to.delete
  end
end
