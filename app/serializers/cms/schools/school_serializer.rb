module CMS
  module Schools
    class SchoolSerializer < ActiveModel::Serializer
      attributes :id, :name, :created_at
      has_many :ciclos

      def ciclos
        object.groups
      end

      def created_at
        object.created_at.iso8601
      end
    end
  end
end
