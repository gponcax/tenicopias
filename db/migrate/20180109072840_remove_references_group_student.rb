class RemoveReferencesGroupStudent < ActiveRecord::Migration[5.1]
  def change
    remove_reference :students, :group, foreign_key: true
  end
end
