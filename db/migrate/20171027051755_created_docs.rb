class CreatedDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :docs do |t|
      t.string :description
      t.string :name
      t.string :document
      t.timestamps
    end
  end
end
