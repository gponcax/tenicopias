module CMS
  module Teachers
    class Find < ::BaseService
      ERROR_TITLE = 'Teacher Error'.freeze

      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
      end

      def call
        result = Teacher.find_by(id: id)

        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Teacher not found'
        ) unless result

        success(result)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end