module CMS
  module Printers
    class PrinterSerializer < ActiveModel::Serializer
      attributes :id, :name, :email, :phone, :created_at

      def created_at
        object.created_at.iso8601
      end
    end
  end
end