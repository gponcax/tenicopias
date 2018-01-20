class RemoveRefTeacherToGroups < ActiveRecord::Migration[5.1]
  def change
    remove_reference :groups, :teacher, foreign_key: true
  end
end
