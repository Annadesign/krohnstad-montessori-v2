class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :summary
      t.text :content
      t.string :image
      t.text :imagetext
      t.string :imagestyle
      t.boolean :publish
      t.references :category, foreign_key: true
      t.references :moderator, foreign_key: true

      t.timestamps
    end
  end
end
