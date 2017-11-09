class CreateStudyCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :study_courses do |t|
      t.references :student, foreign_key: true
      t.references :teacher, foreign_key: true
      t.references :course, foreign_key: true
    end
  end
end
