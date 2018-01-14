class RemoveRefGroupToDocsTable < ActiveRecord::Migration[5.1]
  def change
    remove_reference :docs, :group, foreign_key: true
  end
end
