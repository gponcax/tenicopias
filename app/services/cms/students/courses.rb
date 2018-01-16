module CMS
  module Students
    class Courses < ::BaseService
      ERROR_TITLE = 'Course Error'.freeze
      attribute :id, Integer, writer: :private
      def initialize(id)
        self.id = id
      end

      def call
        student = ::CMS::Students::Find.call(id)
        if student.response.courses.present?
          success student.response.courses
        else
        return error(
                    title: ERROR_TITLE,
                    code: 404,
                    message: 'Student not found'
                    )
        end
      end
    end
  end
end
