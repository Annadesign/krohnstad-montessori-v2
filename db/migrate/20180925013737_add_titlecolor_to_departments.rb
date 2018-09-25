class AddTitlecolorToDepartments < ActiveRecord::Migration[5.1]
  def change
    add_column :departments, :titlecolor, :string
    add_column :departments, :backgroundcolor, :string
  end
end
