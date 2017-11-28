class AddReferencesTeacherToGroups < ActiveRecord::Migration[5.1]
  def change
    add_reference :groups, :teacher, foreign_key: true
  end
end
