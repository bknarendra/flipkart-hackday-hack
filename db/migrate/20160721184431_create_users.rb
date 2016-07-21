class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :twitter_handle , :limit => 255, :null => false
      t.string :access_key , :limit => 255, :null => false
      t.string :secret_key , :limit => 255, :null => false
      t.timestamps null: false
    end
  end
end
