namespace :shop_with_twitter do
  desc "TODO"
  task :twitter_stream_api => :environment do
    client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = GlobalConstant::CONSUMER_KEY
      config.consumer_secret     = GlobalConstant::CONSUMER_SECRET
      config.access_token        = "756209572683980801-MA2ZNyn6vI4Trq5K7z7DOBrtsXDtcuR"
      config.access_token_secret = "4puH1l92mmkRf79vq4h5shTcTiK5ssnhUNGsuWKdrVJ98"
    end
    topics = ["shopwithtwitter"]
    client.filter(track: topics.join(",")) do |object|
      begin
        puts object.to_json
        user = User.find_by_twitter_handle(object["user"]["screen_name"])
        if user
          rest_client = Twitter::REST::Client.new do |config|
            config.consumer_key = GlobalConstant::CONSUMER_KEY
            config.consumer_secret = GlobalConstant::CONSUMER_SECRET
            config.access_token = user.access_key
            config.access_token_secret = user.secret_key
          end
          tweet = JSON.parse(rest_client.status(object["in_reply_to_status_id"]).to_json)
          if tweet["entities"] && tweet["entities"]["urls"][0] && tweet["entities"]["urls"][0]["expanded_url"]
            product_url = tweet["entities"]["urls"][0]["expanded_url"]
            product = Product.find_by_product_url(product_url)
            unless product
              page_obj = ProductPageParser.get_parser(product_url)
              product = Product.create(
                name: page_obj.product_name,
                product_url: product_url,
                product_img_url: page_obj.product_img_url
              )
            end
            user_prod = UserProduct.create(user_id: user.id, product_id: product.id)
          end
        end
      rescue Exception => ex
        puts("Error parsing tweet")
        puts(ex)
      end
    end
  end
end
