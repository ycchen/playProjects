require 'development_mail_interceptor'
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "chen1904@gmail.com",
  :user_name            => "chen1904@gmail.com",
  :password             => "ycc1968",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
# Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if  Rails.env.development?