class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.date :birthday
      t.string :phone

      t.timestamps
    end

    add_index :teachers, :email, unique: true
  end
end
