class AlterEventsUser < ActiveRecord::Migration
  def change
      add_column :events_users, :tickets_count, :integer
      add_column :events_users, :total_price, :integer
  end
end
