class AddSemesterToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :semester, :integer
  end
end
