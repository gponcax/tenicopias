class AddIndexUserIdToStatuses < ActiveRecord::Migration[5.1]
  def change
    add_column :statuses, :user_id, :bigint
  end
end
