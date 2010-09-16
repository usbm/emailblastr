require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context "validates" do
    should have_many :lists
    should have_many :blast_messages
  
    should validate_presence_of :login
    should validate_uniqueness_of :login
  end
  
  context "with many lists, reply-tos, and subscribers" do
    setup do
      @lists = []
      @reply_tos = []
       
      2.times do |i|
        @lists[i] = Factory(:list, :user => @user, :name => "My list #{i}")
        @reply_tos[i] = Factory(:reply_to, :user => @user, :email => "my_email_#{i}@my-domain.com")
        5.times do |j|
          Factory(:subscriber, :list => @lists[i], :email => "my-email-#{j}@my-domain-#{i}.com")
          Factory(:autoresponder, :list => @lists[i], :name => "My autoresponder #{i*j}", :reply_to => @reply_tos[i])
        end
        bm = Factory(:blast_message, :user => @user, :name => "My blast message #{i}", :reply_to => @reply_tos[i], :lists => [@lists[i]])
      end
    end
    
    should "have the correct number of lists" do
      assert @user.lists.count == 2
    end
    
    should "have the correct number of reply-tos" do
      assert @user.reply_tos.count == 2
    end
    
    should "have the correct number of subscribers" do
      assert @user.subscribers.count == 10
    end
    
    should "have the correct number of autoresponders" do
      assert @user.autoresponders.count == 10
    end
    
    should "have the correct number of blast messages" do
      assert @user.blast_messages.count == 2
    end
    
    teardown do
      @user.lists.delete_all
      @user.reply_tos.delete_all
      @user.subscribers.delete_all
      @user.autoresponders.delete_all
      @user.blast_messages.delete_all
    end
  end
  
end
