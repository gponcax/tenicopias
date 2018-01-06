class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :email
      t.date :birthdate
      t.string :phone
      t.string :dui
      t.string :address
      t.timestamps
    end
  end
end
