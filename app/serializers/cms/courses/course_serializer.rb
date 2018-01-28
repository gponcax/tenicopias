module CMS
  module Courses
    class CourseSerializer < ActiveModel::Serializer
      attributes :id, :name, :start_time, :end_time
      belongs_to :teacher
      def created_at
        object.created_at.iso8601
      end
    end
  end
end
