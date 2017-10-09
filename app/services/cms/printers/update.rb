module CMS
  module Printers
    class Update < ::BaseService
      ERROR_TITLE = 'Printers Error'.freeze

      attribute :id, Integer, writer: :private

      def initialize(params = {})
        self.id = params[:id]
        self.params = params.except(:id)
      end

      def call
        result = ::CMS::Printers::Find.call(id)

        return error(result) unless result.succeed?

        success(
          result.response.update!(params)
        )
      rescue ActiveRecord::RecordInvalid => e
        return error(response: e.record, title: ERROR_TITLE, code: 422,
                     message: 'Printer could not be updated', errors: e.record.errors)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end