class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name , :limit => 1000, :null =>false
      t.string :product_url , :limit => 1000, :null =>false
      t.string :product_img_url , :limit => 1000, :null =>false
      t.timestamps null: false
    end
  end
end
