class AddLatToSchools < ActiveRecord::Migration[5.1]
  def change
    add_column :schools, :lat, :string
    add_column :schools, :lng, :string
  end
end
