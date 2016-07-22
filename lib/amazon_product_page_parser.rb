class AmazonProductPageParser
  def initialize(url)
    @client = Mechanize.new{|x| x.user_agent_alias = 'Mac Safari'}
    @url = url
    @page = @client.get(@url).parser
  end

  def product_img_url
    ""
  end

  def product_name
    ""
  end
end