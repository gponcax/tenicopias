class AddAttachmentDocumentToDocs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :docs do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :docs, :document
  end
end
