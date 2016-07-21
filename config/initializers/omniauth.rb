Rails.application.config.middleware.use OmniAuth::Builder do
  if ENV['CONSUMER_KEY'].blank? || ENV['CONSUMER_SECRET'].blank?
    warn '*' * 80
    warn 'WARNING: Missing consumer key or secret. First, register an app with Twitter at'
    warn 'https://dev.twitter.com/apps to obtain OAuth credentials. Then, start the server'
    warn 'with the command: CONSUMER_KEY=abc CONSUMER_SECRET=123 rails server'
    warn '*' * 80
  else
    provider :twitter, "r9L3LNSwkUosmIXwt8UoSCgIh", "Gr4yxcQzNyR3L6ODHSKjNiKhbEILFqwbqSF8cyDWZXQHFM10N1"
  end
end
