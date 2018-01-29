module CMS
  module Groups
    class GroupSerializer < ActiveModel::Serializer
      attributes  :id, :name,  :year, :semester,
                  :description, :created_at

      has_many :courses
      
      def created_at
        object.created_at.iso8601
      end
    end
  end
end
