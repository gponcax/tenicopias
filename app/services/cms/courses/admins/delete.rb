module CMS
  module Courses
    module Admins
      class Delete < ::BaseService

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
          return error(response: e.record, title: "Printer Error", code: 422,
                       message: 'Course could not be deleted', errors: e.record.errors)
        rescue => e
          return error(reponse: e, title: "Printer Error", message: e.message, code: 422)
        end
      end
    end
  end
end
