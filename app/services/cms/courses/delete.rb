module CMS
  module Courses
    class Delete < ::BaseService
      ERROR_TITLE = 'Printer Error'.freeze

      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
      end

      def call
        result = ::CMS::Courses::Find.call(id)

        return error(result) unless result.succeed?

        success(
          result.response.destroy!
        )
      rescue ActiveRecord::RecordInvalid => e
        return error(response: e.record, title: ERROR_TITLE, code: 422,
                     message: 'Course could not be deleted', errors: e.record.errors)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end
