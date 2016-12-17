class AddImagesToUsers < ActiveRecord::Migration
  def change
  	rename_column :schools, :avatar, :logo
  	add_column :schools, :bg_img, :string

  	add_column :individuals, :bg_img, :string

  	add_column :events, :bg_img, :string
  end
end
