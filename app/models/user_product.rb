class UserProduct < ActiveRecord::Base


  def self.get_user_products(user_id)
    return unless user_id
    user_products =  UserProduct.where(:user_id => user_id).first
    if user_products
      products =  Product.where(user_products.product_id).first
      {:user_id => user_id,
      :image_url => products.product_img_url,
      :product_url => products.product_url
      }
    else
      nil
    end

  end
end

