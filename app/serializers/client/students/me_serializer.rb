module Client
  module Students
    class MeSerializer < ActiveModel::Serializer
      attributes :id, :name, :email, :birthdate, :phone, :dui, :avatar, :created_at

      def created_at
        object.created_at.iso8601
      end

      def avatar
        avatar = object.avatar.url
      end
    end
  end
end
