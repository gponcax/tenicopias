class AddPhoneToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :phone, :string
  end
end
