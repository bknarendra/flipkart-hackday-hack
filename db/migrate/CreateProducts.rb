class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :id, :bigint => 20, :null=>false
      t.string :name, :limit => 64, :null => false
      t.string :product_img_url, :limit => 255, :null=>false
      t.string :product_url, :limit => 255, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
