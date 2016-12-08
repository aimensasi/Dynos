class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :level
      t.string :category
      t.string :avatar
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
