class UserProduct < ActiveRecord::Base


  def self.get_user_products(user_id)
    array = []
    return array unless user_id
    user_products =  UserProduct.where(:user_id => user_id).all
    if user_products.size > 0
      user_products.each do |product|
        products =  Product.where(id: product.product_id).first
        array << {:user_id => user_id,
                  :image_url => products.product_img_url,
                  :product_url => products.product_url,
                  name: products.name
        }
      end
    else
      array << {
          user_id: user_id,
          image_url: 'https://support.kounta.com/hc/en-us/article_attachments/201775924/Screen_Shot_2014-12-03_at_5.14.29_pm.png',
          product_url: 'https://twitter.com'
      }
    end
    array
  end
end

