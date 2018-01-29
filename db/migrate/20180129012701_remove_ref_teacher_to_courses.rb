class RemoveRefTeacherToCourses < ActiveRecord::Migration[5.1]
  def change
    remove_reference :courses, :teacher, foreign_key: true
  end
end
