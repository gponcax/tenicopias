module CMS
  module Courses
    module Admins
      class Find < ::BaseService


        attribute :id, Integer, writer: :private

        def initialize(id)
          self.id = id
        end

        def call
          admin = Course.find_by(id: id)

          return error(
            title: "Course Error",
            code: 404,
            message: 'Course not found'
          ) unless admin

          success(admin)
        rescue => e
          return error(reponse: e, title: "Course Error", message: e.message, code: 422)
        end
      end
    end
  end
end
