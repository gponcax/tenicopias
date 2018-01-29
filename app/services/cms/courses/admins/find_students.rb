module CMS
  module Courses
    module Admins
      class FindStudents < ::BaseService


        attribute :id, Integer, writer: :private

        def initialize(id)
          self.id = id
        end

        def call
          course = Course.find(id)
          docs = course.students
          return error(
            title: "Printer Error",
            code: 404,
            message: 'Course not found'
          ) unless docs

          success(docs)
        rescue => e
          return error(reponse: e, title: "Printer Error", message: e.message, code: 422)
        end
      end
    end
  end
end
