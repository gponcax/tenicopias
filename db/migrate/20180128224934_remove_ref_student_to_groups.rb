class RemoveRefStudentToGroups < ActiveRecord::Migration[5.1]
  def change
    remove_reference :groups, :student, foreign_key: true
  end
end
