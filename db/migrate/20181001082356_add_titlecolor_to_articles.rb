class AddTitlecolorToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :titlecolor, :string
  end
end
