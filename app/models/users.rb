class Users < ActiveRecord::Base
  has_many :user_products

end