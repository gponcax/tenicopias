module CMS
  module Groups
    class Create < ::BaseService
      ERROR_TITLE = 'Group Error'.freeze

      def initialize(params = {})
        self.params = params
      end

      def call
        success(
          Group.create!(params)
        )
      rescue ActiveRecord::RecordInvalid => e
        return error(response: e.record, title: ERROR_TITLE, code: 422,
                     message: 'Group could not be created', errors: e.record.errors)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end
