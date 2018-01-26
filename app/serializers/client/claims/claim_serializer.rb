module Client
  module Claims
    class ClaimSerializer < ActiveModel::Serializer
      attributes  :id,:document, :denied, :printed,
                  :sent, :delivered, :approved, :token
      belongs_to :student
      def document
        object.doc
      end

      def created_at
        object.created_at.iso8601
      end
    end
  end
end
