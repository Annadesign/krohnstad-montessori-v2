class CreateChildParents < ActiveRecord::Migration[5.1]
  def change
    create_table :child_parents do |t|
      t.references :child, foreign_key: true
      t.references :parent, foreign_key: true

      t.timestamps
    end
  end
end
