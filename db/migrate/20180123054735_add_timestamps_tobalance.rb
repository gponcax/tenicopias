class AddTimestampsTobalance < ActiveRecord::Migration[5.1]
  def change
    add_timestamps(:balances)
  end
end
