class AddEndTimeToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :end_time, :timestamp
  end
end
