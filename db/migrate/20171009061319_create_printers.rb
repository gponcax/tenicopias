class CreatePrinters < ActiveRecord::Migration[5.1]
  def change
    create_table :printers do |t|
    	t.string :name, null: false
      t.string :email, null: false
      t.date :birthday

      t.timestamps
    end

      add_index :printers, :email, unique: true
  end
end
