class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :description
      t.string :document
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
