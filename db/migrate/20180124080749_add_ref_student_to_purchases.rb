class AddRefStudentToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_reference :purchases, :student, foreign_key: true
  end
end
