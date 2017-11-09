class CreatedDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :docs do |t|
      t.integer :doctionable_id
      t.string  :doctionable_type
      t.string :transaction_id
      t.string :description
      t.string :name
      t.timestamps
    end
    add_index :docs, [:doctionable_type, :doctionable_id],
              name: :idx_docs_on_doctionable_type_doctionable
  end
end
