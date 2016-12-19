class AddValidationOnTickets < ActiveRecord::Migration
  def change
  	change_column :tickets, :individual_id, :integer, :null => false
  	change_column :tickets, :event_id, :integer, :null => false
  end
end
