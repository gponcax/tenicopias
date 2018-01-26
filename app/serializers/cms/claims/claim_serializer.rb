module CMS
  module Claims
    class ClaimSerializer < ActiveModel::Serializer
      attributes  :id, :denied, :printed,
                  :sent, :delivered, :approved,
                  :token, :created_at, :updated_at, :student,:doc
       belongs_to :student

      def student
        {
          id: object.student.id,
          name: object.student.name,
          email: object.student.email
        }
      end

      def doc
        object.doc
      end

      def created_at
        object.created_at.iso8601
      end
      def updated_at
        object.updated_at.iso8601
      end
    end
  end
end
