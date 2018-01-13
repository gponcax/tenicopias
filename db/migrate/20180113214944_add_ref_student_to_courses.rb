class AddRefStudentToCourses < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :student, foreign_key: true
  end
end
