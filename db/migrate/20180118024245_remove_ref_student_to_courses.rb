class RemoveRefStudentToCourses < ActiveRecord::Migration[5.1]
  def change
    remove_reference :courses, :student, foreign_key: true
  end
end
