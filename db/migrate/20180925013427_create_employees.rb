class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :lastname
      t.string :firstname
      t.string :email
      t.string :telephone
      t.string :position
      t.string :image
      t.text :description
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
