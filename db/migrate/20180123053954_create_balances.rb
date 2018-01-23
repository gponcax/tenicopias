class CreateBalances < ActiveRecord::Migration[5.1]
  def change
    create_table :balances do |t|
      t.integer :total_amount
    end
  end
end
