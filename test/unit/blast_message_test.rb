require 'test_helper'

class BlastMessageTest < ActiveSupport::TestCase
  context "validates" do
    should validate_presence_of :name
    should validate_presence_of :subject
    should validate_presence_of :reply_to_id
    should validate_presence_of :from_name
  end
  
  context "can be delivered" do
    setup do
      @list = @user.lists.build(Factory.attributes_for(:list))
      ['jim@jimbos.com', 'max@maximillion.org', 'alice@debo.com', 'jeepers@jeepers.com', 'test@test.com'].each do |email|
        @list.subscribers.build(Factory.attributes_for(:subscriber, :email => email))
      end
      @list2 = @user.lists.build(Factory.attributes_for(:list, :name => "My other list"))
      ['jim@jimbos.com', 'max@maximillion.org', 'asdf@fdsa.com','fafsa@afspa.com'].each do |email|
        @list2.subscribers.build(Factory.attributes_for(:subscriber, :email => email))
      end
      @message = @user.blast_messages.build(Factory.attributes_for(:blast_message, :lists => [@list, @list2]))
    end  
  
    should "correctly de-dupe recipients" do
      assert @message.recipients.size == 7
    end
  end
end
