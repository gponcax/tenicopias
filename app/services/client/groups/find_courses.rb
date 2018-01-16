module Client
  module Groups
    class FindCourses < ::BaseService
      ERROR_TITLE = 'Group Error'.freeze

      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
      end

      def call
        group = ::Client::Groups::Find.call(id)
        courses = group.response.courses

        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Group not found'
        ) unless courses

        success(courses)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end
