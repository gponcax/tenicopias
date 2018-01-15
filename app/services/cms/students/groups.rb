module CMS
  module Students
    class Groups < ::BaseService
      ERROR_TITLE = 'Student Error'.freeze
      attribute :id, Integer, writer: :private
      def initialize(id)
        self.id = id
      end

      def call
        student = ::CMS::Students::Find.call(id)
        if student.response.groups.present?
          success student.response.groups
        else
        return error(
                    title: ERROR_TITLE,
                    code: 404,
                    message: 'Student not found'
                    )
        end

        rescue ActiveRecord::RecordInvalid => e
        return error(response: e.record, title: ERROR_TITLE, code: 422,
                     message: 'Student could not be created', errors: e.record.errors)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end
