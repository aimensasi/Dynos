class ModifyUserRoles < ActiveRecord::Migration
  def change
  	
  	
  	remove_column :users, :first_name
  	remove_column :users, :last_name
  	remove_column :users, :location
  	remove_column :users, :avatar

  	add_column :users, :role, :string

  	remove_column :schools, :email
  	remove_column :schools, :password_digest

  	add_reference :schools, :user, :index => true

  	
  	create_table :individuals do |t|
  		t.string :first_name
      t.string :last_name
      t.string :location
      t.string :avatar
      t.references :user, :index => true
  		t.timestamps :null => false
  	end
  end
end
