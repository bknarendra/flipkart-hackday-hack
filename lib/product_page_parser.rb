class ProductPageParser
  def self.get_parser(url)
    if url.index(/http.*flipkart\./)
      return FlipkartProductPageParser.new(url)
    elsif url.index(/http.*amazon\./)
      return AmazonProductPageParser.new(url)
    end
  end
end