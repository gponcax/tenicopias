class AddRefCourseToDocs < ActiveRecord::Migration[5.1]
  def change
    add_reference :docs, :course, foreign_key: true
  end
end
