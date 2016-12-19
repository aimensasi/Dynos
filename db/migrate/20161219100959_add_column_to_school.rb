class AddColumnToSchool < ActiveRecord::Migration
  def change

    add_column :schools, :phone, :string
    add_column :schools, :website, :string


  end
end
