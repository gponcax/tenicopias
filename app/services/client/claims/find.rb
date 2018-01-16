module CMS
  module Courses
    class Find < ::BaseService
      ERROR_TITLE = 'Course Error'.freeze

      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
        self.
      end

      def call
        admin = Course.find_by(id: id)

        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Course not found'
        ) unless admin

        success(admin)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end
