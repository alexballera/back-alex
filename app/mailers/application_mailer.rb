class ApplicationMailer < ActionMailer::Base
  default to: Proc.new { User.pluck(:email)},
          from: "alexballera@gmail.com"
  layout 'mailer'
end
