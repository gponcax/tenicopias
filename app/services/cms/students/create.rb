module CMS
  module Students
    class Create < ::BaseService
      ERROR_TITLE = 'Student Error'.freeze

      def initialize(params = {})
        self.params = params
      end

      def call
        success(
          Student.create!(params)
        )
      rescue ActiveRecord::RecordInvalid => e
        return error(response: e.record, title: ERROR_TITLE, code: 422,
                     message: 'Student could not be created', errors: e.record.errors)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end