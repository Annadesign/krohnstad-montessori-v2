class AddAuthTokenToParent < ActiveRecord::Migration[5.1]
  def change
    add_column :parents, :auth_token, :string
  end
end
