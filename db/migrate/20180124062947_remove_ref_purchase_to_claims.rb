class RemoveRefPurchaseToClaims < ActiveRecord::Migration[5.1]
  def change
    remove_reference :claims, :purchase, foreign_key: true
  end
end
