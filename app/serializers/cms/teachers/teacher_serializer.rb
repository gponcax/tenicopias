module CMS
  module Teachers
    class TeacherSerializer < ActiveModel::Serializer
      attributes :id, :name, :email, :phone, :created_at, :study_classes

      def study_classes
        object.course_classes
      end

      def created_at
        object.created_at.iso8601
      end

      def birthdate
        object.birthdate&.iso8601
      end
    end
  end
end
