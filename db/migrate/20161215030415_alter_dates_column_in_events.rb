class AlterDatesColumnInEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :start_date
  	rename_column :events, :end_date, :date
  end
end
