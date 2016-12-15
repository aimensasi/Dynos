class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :category
      t.string :avatar
      t.string :password_digest
      t.string :email
      t.integer :reviews
      t.integer :min_age
      t.integer :max_age
      t.string :cover
      t.timestamps null: false
    end
  end
end
