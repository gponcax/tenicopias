class AddFieldsToStatuses < ActiveRecord::Migration[5.1]
  def change
    add_column :statuses, :denied, :boolean
    add_column :statuses, :printed, :boolean
    add_column :statuses, :delivered, :boolean
    add_column :statuses, :approved, :boolean   
  end
end
