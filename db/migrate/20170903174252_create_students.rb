class CreateStudents < ActiveRecord::Migration[5.1]
  def up
    create_table :students do |t|
      t.string :name, null: false
      t.string :email
      t.date :birthdate
      t.string :phone

      t.timestamps
    end

    execute <<-SQL
      CREATE TYPE student_genders AS ENUM ('M', 'F');
    SQL

    add_column :students, :gender, :student_genders, null: false, default: 'F'
  end

  def down
    drop_table :students
    execute <<-SQL
      DROP TYPE account_type_enum;
    SQL
  end
end
