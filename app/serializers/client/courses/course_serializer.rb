module Client
  module Courses
    class CourseSerializer < ActiveModel::Serializer
      attributes :id, :name

      def created_at
        object.created_at.iso8601
      end
    end
  end
end
