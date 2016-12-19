class AlterUserIdToIndividualId < ActiveRecord::Migration
  def change
  	rename_column :tickets, :user_id, :individual_id
  end
end
