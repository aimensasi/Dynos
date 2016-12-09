class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date
      t.string :location
      t.time :start_time
      t.time :end_time
      t.integer :min_age
      t.integer :max_age
      t.references :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
