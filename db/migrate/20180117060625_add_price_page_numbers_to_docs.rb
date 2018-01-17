class AddPricePageNumbersToDocs < ActiveRecord::Migration[5.1]
  def change
    add_column :docs, :price, :integer, default: 0
    add_column :docs, :page_numbers, :integer, default: 0
  end
end
