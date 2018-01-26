class AddTokenToClaims < ActiveRecord::Migration[5.1]
  def change
    add_column :claims, :token, :string
  end
end
