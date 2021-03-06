class CreateGalleries < ActiveRecord::Migration[5.1]
  def change
    create_table :galleries do |t|
      t.string :name
      t.text :description
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
