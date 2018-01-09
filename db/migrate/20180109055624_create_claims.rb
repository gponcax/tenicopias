class CreateClaims < ActiveRecord::Migration[5.1]
  def change
    create_table :claims do |t|
      t.belongs_to :student, index: true
      t.belongs_to :doc, index: true
      t.datetime :date
      t.timestamps
    end
  end
end
