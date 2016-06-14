class ApplicationMailer < ActionMailer::Base
  default to: ENV["ADMIN_EMAIL"]
end
