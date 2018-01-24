class AddScopeToStatuses < ActiveRecord::Migration[5.1]
  def change
    add_column :statuses, :scope, :string
  end
end
