class AddRefCourseToGroups < ActiveRecord::Migration[5.1]
  def change
    add_reference :groups, :course, foreign_key: true
  end
end