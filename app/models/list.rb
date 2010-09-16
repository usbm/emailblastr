class List < ActiveRecord::Base
  belongs_to :user
  has_many :subscribers, :order => 'created_at desc', :dependent => :destroy
  has_many :autoresponders, :dependent => :destroy
  has_and_belongs_to_many :blast_messages
  validates_uniqueness_of :from_email_slug
  validates_presence_of :name, :from_email_slug
end
