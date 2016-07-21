class UserProducts < ActiveRecord::Base

  belongs_to :users
  has_many :products

end