class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,  and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :email, :password, :password_confirmation, :remember_me
  
  validates_presence_of :login
  validates_uniqueness_of :login
  
  has_many :lists, :order => 'name asc', :dependent => :destroy
  has_many :subscribers, :through => :lists, :order => 'created_at desc'
  has_many :reply_tos, :order => 'email asc', :dependent => :destroy
  has_many :autoresponders, :through => :lists, :order => 'created_at desc'
  has_many :blast_messages, :dependent => :destroy, :order => 'created_at desc'
end
