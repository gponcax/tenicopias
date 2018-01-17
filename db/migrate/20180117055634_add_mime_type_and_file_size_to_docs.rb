class AddMimeTypeAndFileSizeToDocs < ActiveRecord::Migration[5.1]
  def change
    add_column :docs, :mime_type, :string
    add_column :docs, :file_size, :integer
  end
end
