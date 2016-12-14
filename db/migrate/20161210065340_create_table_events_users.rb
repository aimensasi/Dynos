class CreateTableEventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users , id: false do |t|
      t.belongs_to :event, index: true
      t.belongs_to :user, index: true
      t.integer :amount
      t.integer :total_price
      t.string :status, default: "pending"
    end
  end
end
