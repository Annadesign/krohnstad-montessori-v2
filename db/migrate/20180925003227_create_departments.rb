class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.text :description
      t.string :contactperson
      t.string :email
      t.string :telephone
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
