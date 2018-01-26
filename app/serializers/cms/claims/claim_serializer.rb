module CMS
  module Claims
    class ClaimSerializer < ActiveModel::Serializer
      attributes  :id,:doc, :denied, :printed,
                  :sent, :delivered, :approved,
                  :token
      def doc
        object.doc
      end

      def created_at
        object.created_at.iso8601
      end
    end
  end
end
