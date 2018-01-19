class AddRefWalletToClaims < ActiveRecord::Migration[5.1]
  def change
    add_reference :claims, :wallet, foreign_key: true
  end
end
