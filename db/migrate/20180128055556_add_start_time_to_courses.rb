class AddStartTimeToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :start_time, :timestamp
  end
end
