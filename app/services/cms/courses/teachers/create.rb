module CMS
  module Courses
    module Teachers
      class Create < ::BaseService
        ERROR_TITLE = 'Course Error'.freeze

        attribute :params, Hash, writer: :private
        attribute :user, Object, writer: :private

        def initialize(user, params = {})
          self.params = params.except(:id)
          self.user = user
        end

        def call
          
          course = user.course_classes.create!(params)

          success course
        rescue ActiveRecord::RecordInvalid => e
          return error( response: e.record,
                        title: ERROR_TITLE, code: 422,
                        message: 'Course could not be created',
                        errors: e.record.errors)
        rescue => e
          return error(reponse: e,
                      title: ERROR_TITLE,
                      message: e.message,
                      code: 422)
        end
      end
    end
  end
end
