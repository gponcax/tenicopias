module Client
  module Claims
    class ClaimSerializer < ActiveModel::Serializer
      attributes :id, :send, :denied, :printed, :delivered, :approved

      def created_at
        object.created_at.iso8601
      end
    end
  end
end
