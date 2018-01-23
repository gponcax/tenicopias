class AddRefPurchaseToClaims < ActiveRecord::Migration[5.1]
  def change
    add_reference :claims, :purchase, foreign_key: true
  end
end
