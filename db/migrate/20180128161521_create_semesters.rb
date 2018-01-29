class CreateSemesters < ActiveRecord::Migration[5.1]
  def change
    create_table :semesters do |t|
      t.references :student, foreign_key: true
      t.references :group, foreign_key: true
    end
  end
end
