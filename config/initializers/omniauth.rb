Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, GlobalConstant::CONSUMER_KEY, GlobalConstant::CONSUMER_SECRET
end
