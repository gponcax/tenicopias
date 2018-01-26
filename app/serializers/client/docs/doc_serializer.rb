module Client
  module Docs
    class DocSerializer < ActiveModel::Serializer
      attributes  :id, :name, :description, :document, :mime_type, :file_size,
                  :price, :page_numbers, :document_file_name

      def created_at
        object.created_at.iso8601
      end

      def price
        currency = Money.new(object.price, "USD").format
      end
    end
  end
end
