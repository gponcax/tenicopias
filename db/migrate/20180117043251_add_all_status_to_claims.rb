class AddAllStatusToClaims < ActiveRecord::Migration[5.1]
  def change
    add_column :claims, :sent, :boolean, default: true
    add_column :claims, :denied, :boolean, default: false
    add_column :claims, :printed, :boolean, default: false
    add_column :claims, :delivered, :boolean, default: false
    add_column :claims, :approved, :boolean, default: false
  end
end
