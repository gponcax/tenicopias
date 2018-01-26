module CMS
  module Docs
    class DocSerializer < ActiveModel::Serializer
      attributes  :id, :name, :description, :document, :mime_type, :file_size,
                  :price, :page_numbers, :document_file_name
       belongs_to :course
      def created_at
        object.created_at.iso8601
      end
    end
  end
end
