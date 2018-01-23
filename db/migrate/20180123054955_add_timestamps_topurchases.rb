class AddTimestampsTopurchases < ActiveRecord::Migration[5.1]
  def change
    add_timestamps(:purchases)
  end
end
