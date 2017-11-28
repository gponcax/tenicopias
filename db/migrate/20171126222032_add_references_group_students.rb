class AddReferencesGroupStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :group, foreign_key: true
  end
end
