namespace :shop_with_twitter do
  desc "TODO"
  task :twitter_stream_api => :environment do
    client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = GlobalConstant::CONSUMER_KEY
      config.consumer_secret     = GlobalConstant::CONSUMER_SECRET
      config.access_token        = "709250762-IBCuFDYKJQ5UCHimBbMOXxtvM5gfGG6ZJ3NwToZv"
      config.access_token_secret = "voU70d7QysP6vZG79kmFiLAaYDnWZAmwhW4wqBJxGYIA1"
    end
    topics = ["shopwithtwitter"]
    client.filter(track: topics.join(",")) do |object|

    end
  end

end
