module CMS
  module Courses
    module Admins
      class Create < ::BaseService

        attribute :att, Hash, writer: :private
        attribute :id, Integer, writer: :private

        def initialize(params = {})
          self.att = params.except(:id)
          self.id = params['id']
        end

        def call
          
          group = Group.find_by!(id: id)
          if group.succeed?
            course = group.courses.create!(params)
          else
          return error(
            title: 'Course Error',
            code: 404,
            message: 'Group not found'  )
          end

          success course
        rescue ActiveRecord::RecordInvalid => e
          return error( response: e.record,
                        title: 'Course Error', code: 422,
                        message: 'Course could not be created',
                        errors: e.record.errors)
        rescue => e
          return error(reponse: e,
                      title: 'Course Error',
                      message: e.message,
                      code: 422)
        end
      end
    end
  end
end
