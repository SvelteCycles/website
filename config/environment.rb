# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
   :tls => true,
   :address => "smtpout.europe.secureserver.net",
   :port => 80,
   :domain => "www.svelte-cycles.com",
   :authentication => :plain,
   :user_name => ENV["MAILER_EMAIL"],
   :password => ENV["MAILER_PASSWORD"]
 }
