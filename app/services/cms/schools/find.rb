module CMS
  module Schools
    class Find < ::BaseService
      ERROR_TITLE = 'School Error'.freeze

      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
      end

      def call
        admin = School.find_by(id: id)

        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'School not found'
        ) unless admin

        success(admin)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end
