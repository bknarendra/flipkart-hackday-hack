class FlipkartProductPageParser
  def initialize(url)
    @client = Mechanize.new{|x| x.user_agent_alias = 'Mac Safari'}
    @url = url
    @page = @client.get(@url).parser
  end

  def product_img_url
    @page.css(".productImages .mainImage .imgWrapper img").first["data-src"]
  end

  def product_name
    @page.css('.product-details [itemprop="name"]').first.text
  end
end