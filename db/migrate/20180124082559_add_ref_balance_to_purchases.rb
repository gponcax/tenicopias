class AddRefBalanceToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_reference :purchases, :balance, foreing_key: true
  end
end
