class ChangeColBalanceToWallets < ActiveRecord::Migration[5.1]
  def change
    change_column :wallets, :balance, 'integer USING CAST(balance AS integer)', default: 0
  end
end
