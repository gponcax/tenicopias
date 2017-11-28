module CMS
  module Groups
    class GroupSerializer < ActiveModel::Serializer
      attributes :id, :name, :description, :created_at

      def created_at
        object.created_at.iso8601
      end
    end
  end
end
