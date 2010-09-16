class ReplyTo < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  
  validates_presence_of :email
  
  before_create :assign_secret
  
  def name
    email
  end
  
  protected
  
  def assign_secret
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
    self.secret = ''
    33.times { self.secret << chars[rand(chars.size)] }
  end
end
