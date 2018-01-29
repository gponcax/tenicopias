module CMS
  module StudyClasses
    module Teachers
      class Create < ::BaseService
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
                        title: "Study Claasses", code: 422,
                        message: 'Course could not be created',
                        errors: e.record.errors)
        rescue => e
          return error(reponse: e,
                      title: "Study Claasses",
                      message: e.message,
                      code: 422)
        end
      end
    end
  end
end
