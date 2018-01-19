class RemoveRefGroupToCourses < ActiveRecord::Migration[5.1]
  def change
    remove_reference :courses, :group, foreign_key: true
  end
end
