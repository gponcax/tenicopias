module CMS
  module Courses
    class FindDocs < ::BaseService
      ERROR_TITLE = 'Course Error'.freeze

      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
      end

      def call
        course = Course.find(id)
        docs = course.docs
        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Course not found'
        ) unless docs

        success(docs)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end
