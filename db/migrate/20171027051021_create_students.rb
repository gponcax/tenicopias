class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
    	t.string :name, null: false
      t.string :email, null: false
      t.date :birthdate

      t.timestamps
    end

      add_index :students, :email, unique: true
  end
end
