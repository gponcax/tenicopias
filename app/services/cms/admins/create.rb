module CMS
  module Admins
    class Create < ::BaseService
      def initialize(params = {})
        self.params = params
      end

      def call
        success(
          Admin.create!(params)
        )
      rescue ActiveRecord::RecordInvalid => e
        return error(response: e.record, title: 'Admin Error', code: 422,
                     message: 'Admin could not be created', errors: e.record.errors)
      rescue => e
        return error(reponse: e, title: 'Admin Error', message: e.message, code: 422)
      end
    end
  end
end
