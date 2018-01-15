module CMS
  module Students
    class StudentSerializer < ActiveModel::Serializer
      attributes :id, :name, :avatar, :email, :birthdate, :gender, :phone, :created_at

      def created_at
        object.created_at.iso8601
      end
    end
  end
end
