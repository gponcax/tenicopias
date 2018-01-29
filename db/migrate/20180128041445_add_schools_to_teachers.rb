class AddSchoolsToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :schools, :string
  end
end
