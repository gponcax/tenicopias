class CreateCoursesClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :course_classes do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :teacher, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
