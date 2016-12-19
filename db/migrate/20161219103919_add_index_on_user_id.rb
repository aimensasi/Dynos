class AddIndexOnUserId < ActiveRecord::Migration
  def change
  	remove_index :schools, :user_id if index_exists?(:schools, :user_id)
  	
  	add_index :schools, :user_id, :unique => true
  end
end
