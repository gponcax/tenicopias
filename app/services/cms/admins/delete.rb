module CMS
  module Admins
    class Delete < ::BaseService

      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
      end

      def call
        result = ::CMS::Admins::Find.call(id)

        return error(result) unless result.succeed?

        success(
          result.response.destroy!
        )
      rescue ActiveRecord::RecordInvalid => e
        return error(response: e.record, title: "Admin Error", code: 422,
                     message: 'Admin could not be deleted', errors: e.record.errors)
      rescue => e
        return error(reponse: e, title: "Admin Error", message: e.message, code: 422)
      end
    end
  end
end
