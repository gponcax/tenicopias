class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.string :balance
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
