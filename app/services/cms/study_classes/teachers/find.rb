module CMS
  module Courses
    module Teachers
      class Find < ::BaseService
        ERROR_TITLE = 'Course Error'.freeze

        attribute :id, Integer, writer: :private
        attribute :user, Object, writer: :private

        def initialize(user, id)
          self.id = id
          self.user = user
        end

        def call
          course = user.courses.find_by(id: id)
          return error(
            title: ERROR_TITLE,
            code: 404,
            message: 'Course not found'
          ) unless course

          success(course)
        rescue => e
          return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
        end
      end
    end
  end
end
