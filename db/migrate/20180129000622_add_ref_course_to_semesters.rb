class AddRefCourseToSemesters < ActiveRecord::Migration[5.1]
  def change
    add_reference :semesters, :course, foreign_key: true
  end
end
