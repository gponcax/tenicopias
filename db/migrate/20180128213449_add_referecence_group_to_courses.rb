class AddReferecenceGroupToCourses < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :group, foreign_key: true
  end
end
