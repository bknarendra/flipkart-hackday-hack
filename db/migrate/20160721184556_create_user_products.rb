class CreateUserProducts < ActiveRecord::Migration
  def change
    create_table :user_products do |t|
      t.integer :user_id, :null => false
      t.integer :product_id , :null => false
      t.timestamps null: false
    end
  end
end
