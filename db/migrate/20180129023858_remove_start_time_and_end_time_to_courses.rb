class RemoveStartTimeAndEndTimeToCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :start_time, :timestamp
    remove_column :courses, :end_time, :timestamp
  end
end
