class AddRefStudentToGroups < ActiveRecord::Migration[5.1]
  def change
    add_reference :groups, :student, foreign_key: true
  end
end
