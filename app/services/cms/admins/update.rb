module CMS
  module Admins
    class Update < ::BaseService


      attribute :id, Integer, writer: :private

      def initialize(params = {})
        self.id = params[:id]
        self.params = params.except(:id)
      end

      def call
        result = ::CMS::Admins::Find.call(id)

        return error(result) unless result.succeed?

        success(
          result.response.update!(params)
        )
      rescue ActiveRecord::RecordInvalid => e
        return error(response: e.record, title: "Admin Error", code: 422,
                     message: 'Admin could not be updated', errors: e.record.errors)
      rescue => e
        return error(reponse: e, title: "Admin Error", message: e.message, code: 422)
      end
    end
  end
end
