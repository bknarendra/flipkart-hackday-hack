class CreateUserProducts < ActiveRecord::Migration
  def self.up
    create_table :user_products do |t|
      t.column :id, :bigint => 20, :null=>false
      t.string :product_id, :limit => 255, :null=>false
      t.timestamps
  end
  end

  def self.down
    drop_table :user_products
  end
end
