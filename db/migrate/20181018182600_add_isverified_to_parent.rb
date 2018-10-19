class AddIsverifiedToParent < ActiveRecord::Migration[5.1]
  def change
    add_column :parents, :isverified, :boolean
  end
end
