module CMS
  module Wasllets
    class WaslletSerializer < ActiveModel::Serializer
      attributes :id, :balance

      def created_at
        object.created_at.iso8601
      end

      def balamce
      
      end
    end
  end
end
