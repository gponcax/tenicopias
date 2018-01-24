module CMS
  module Courses
    class CourseSerializer < ActiveModel::Serializer
      attributes :id, :name
      belongs_to :teacher
      def created_at
        object.created_at.iso8601
      end
    end
  end
end
