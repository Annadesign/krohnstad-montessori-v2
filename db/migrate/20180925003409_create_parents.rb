class CreateParents < ActiveRecord::Migration[5.1]
  def change
    create_table :parents do |t|
      t.string :name
      t.string :email
      t.string :telephone
      t.string :password_digest

      t.timestamps
    end
  end
end
