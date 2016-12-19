class AlterEventsUsers < ActiveRecord::Migration
  def change
  	rename_table :events_users, :tickets

  	remove_column :tickets, :tickets_count
  	remove_column :tickets, :total_price

  	add_column :events, :seats, :integer, :default => 0, :null => false
  end
end
