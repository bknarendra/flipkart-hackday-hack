class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :id, :bigint => 20, :null=>false
      t.string :twitter_handle, :limit => 255, :null=>false
      t.string :access_key, :limit => 255, :null=> false
      t.string :secret_key, :limit => 255, :null=> false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
