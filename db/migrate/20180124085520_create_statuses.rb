class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.references :printer, foreign_key: true
      t.references :admin, foreign_key: true
      t.references :claim, foreign_key: true

      t.timestamps
    end
  end
end
