module CMS
  module Students
    class Find < ::BaseService
      ERROR_TITLE = 'Student Error'.freeze

      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
      end

      def call
        admin = Student.find_by(id: id)

        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Student not found'
        ) unless admin

        success(admin)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end
