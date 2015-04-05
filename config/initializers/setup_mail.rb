if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    user_name:      ENV['app34957724@heroku.com'],
    password:       ENV['nq5vnd7n'],
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end