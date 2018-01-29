class AddRefSchoolToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_reference :teachers, :school, foreign_key: true
  end
end
