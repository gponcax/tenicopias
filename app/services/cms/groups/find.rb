module CMS
  module Groups
    class Find < ::BaseService
      ERROR_TITLE = 'Group Error'.freeze

      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
      end

      def call
        admin = Group.find_by(id: id)

        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Group not found'
        ) unless admin

        success(admin)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end
