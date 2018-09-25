class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.text :description
      t.string :contactperson
      t.string :address
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end
end
