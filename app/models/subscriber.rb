class Subscriber < ActiveRecord::Base
  belongs_to :list
  validates_presence_of :email, :list_id
  has_many :message_deliveries
  has_many :messages, :through => :message_deliveries
  
  before_create :assign_secret
  
  named_scope :unique_recipients, select("DISTINCT(email)")
  
  def status_text
    if unsubscribed
      "Unsubscribed"
    elsif confirmed
      "Confirmed"
    else
      "Not confirmed"
    end
  end
  
  protected
  
  def assign_secret
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
    self.secret = ''
    33.times { self.secret << chars[rand(chars.size)] }
  end
end
