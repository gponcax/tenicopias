class AddRefTransactionToClaims < ActiveRecord::Migration[5.1]
  def change
    add_reference :claims, :transaction, foreign_key: true
  end
end
