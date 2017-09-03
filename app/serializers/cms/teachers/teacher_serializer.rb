module CMS
  module Teachers
    class TeacherSerializer < ActiveModel::Serializer
      attributes :id, :name, :email, :birthdate, :phone, :created_at

      def created_at
        object.created_at.iso8601
      end

      def birthdate
        object.birthdate&.iso8601
      end
    end
  end
end