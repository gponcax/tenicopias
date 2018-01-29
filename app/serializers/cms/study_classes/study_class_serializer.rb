module CMS
  module StudyClasses
    class StudyClassSerializer < ActiveModel::Serializer
      attributes :id, :start_time, :end_time

      def created_at
        object.created_at.iso8601
      end
    end
  end
end
