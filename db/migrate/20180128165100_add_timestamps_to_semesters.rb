class AddTimestampsToSemesters < ActiveRecord::Migration[5.1]
  def change
    add_timestamps(:semesters)
  end
end
