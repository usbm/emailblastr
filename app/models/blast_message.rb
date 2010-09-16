class BlastMessage < Message
  has_and_belongs_to_many :lists
  has_many :subscribers, :through => :lists
  
  def status
    delivered ? "Delivered" : "Draft"
  end
  
  def recipients
    recipients = emails = []
    lists.each do |l|
      recipients += l.subscribers.reject do |s|
        if emails.include? s.email
          true
        else
          emails << s.email
          false
        end
      end
    end
  end
  
  def deliver!
    if recipients.size > 0
      self.message_deliveries.create(recipients.collect { |r| {:subscriber_id => r.id } })
      self.update_attributes(:delivered => true, :delivered_at => Time.now)
    end
  end
end
