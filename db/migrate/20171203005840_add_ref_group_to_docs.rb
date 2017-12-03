class AddRefGroupToDocs < ActiveRecord::Migration[5.1]
  def change
    add_reference :docs, :group, foreign_key: true
  end
end
