class AddUniqueOnUserId < ActiveRecord::Migration
  def change
  	remove_index :individuals, :user_id if index_exists?(:individuals, :user_id)
  	# remove_index :schools, :user_ids
  	add_index :individuals, :user_id, :unique => true
  	# add_index :schools, :user_id, :unique => true
  end
end
