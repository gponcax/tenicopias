class AddYearSemesterToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :year, :integer, default: Date.today.year
  end
end
