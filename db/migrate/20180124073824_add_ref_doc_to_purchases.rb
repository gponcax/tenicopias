class AddRefDocToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_reference :purchases, :doc, foreign_key: true
  end
end
