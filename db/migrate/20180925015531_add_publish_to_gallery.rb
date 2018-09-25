class AddPublishToGallery < ActiveRecord::Migration[5.1]
  def change
    add_column :galleries, :publish, :boolean
  end
end
