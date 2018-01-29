class RemoveRefCourseToGroups < ActiveRecord::Migration[5.1]
  def change
    remove_reference :groups, :course, foreign_key: true
  end
end
