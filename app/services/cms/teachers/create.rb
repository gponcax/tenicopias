module CMS
  module Teachers
    class Create < ::BaseService
      ERROR_TITLE = 'Teacher Error'.freeze

      attribute :school_id, Integer, writer: :private
      attribute :params, Object, writer: :private

      def initialize(params = {})
        self.params = params.except(:career_id)
        self.school_id = params[:career_id]
      end

      def call
        school = School.find(school_id)
        unless school.nil?
          success(school.teachers.create!(params))
        else
        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Teacher not found')
        end
      rescue ActiveRecord::RecordInvalid => e
        return error(response: e.record,
                    title: ERROR_TITLE,
                    code: 422,
                    message: 'Teacher could not be created',
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
