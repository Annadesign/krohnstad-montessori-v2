class CreateChildren < ActiveRecord::Migration[5.1]
  def change
    create_table :children do |t|
      t.string :lastname
      t.string :firstname
      t.string :birthdate
      t.references :parent, foreign_key: true
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
