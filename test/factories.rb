Factory.define :user do |u|
  u.login 'username'
  u.password 'pass5372'
  u.password_confirmation 'pass5372'
  u.email { |u| u.login + '@testdomain.com' }
end

Factory.define :list do |l|
  l.name 'My Cool List'
  l.confirmation_text 'Please confirm your subscription'
  l.from_email_slug { "from-address-#{rand(1000)}"}
end

Factory.define :subscriber do |s|
  s.email { "email-#{rand(1000)}@cool-mail.com"}
  s.list { |l| l.association(:list) }
end

Factory.define :confirmed_subscriber, :parent => :subscriber do |s|
  s.confirmed true
end

Factory.define :reply_to do |r|
  r.email { "email-#{rand(1000)}@cool-mail.com"}
end

Factory.define :blast_message do |m|
  m.name 'My blast message'
  m.subject 'My message subject'
  m.html_message '<html><body>This is the body</body></html>'
  m.plain_text_message 'This is the plain-text message'
  m.from_name 'From name'
  m.reply_to { |r| r.association(:reply_to) }
end

Factory.define :autoresponder do |m|
  m.name 'My autoresponder'
  m.subject 'My message subject'
  m.html_message '<html><body>This is the body</body></html>'
  m.plain_text_message 'This is the plain-text message'
  m.list { |l| l.association(:list) }
  m.from_name 'From name'
  m.reply_to { |r| r.association(:reply_to) }
  m.days_to_wait { rand(100) }
end