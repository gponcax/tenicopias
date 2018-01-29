class AddCardIdToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :carnet, :string
  end
end
