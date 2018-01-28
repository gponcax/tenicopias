module CMS
  module Courses
    module Admins
      class Create < ::BaseService
        ERROR_TITLE = 'Course Error'.freeze

        attribute :params, Hash, writer: :private
        attribute :id, Integer, writer: :private

        def initialize(params = {})
          self.params = params.except(:id)
          self.id = params['id']
        end

        def call

          teacher = ::CMS::Teachers::Find.call(id)

          if teacher.succeed?
            course = teacher.response.courses.create!(params)
          else
          return error(
            title: ERROR_TITLE,
            code: 404,
            message: 'Teacher not found'  )
          end

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
