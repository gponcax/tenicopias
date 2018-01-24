class RemoveRefWalletToClaims < ActiveRecord::Migration[5.1]
  def change
    remove_reference :claims, :wallet, foreign_key: true
  end
end
