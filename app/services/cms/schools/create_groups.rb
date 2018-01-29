module CMS
  module Schools
    class CreateGroups < ::BaseService
      ERROR_TITLE = 'Group Error'.freeze

      attribute :params, Hash, writer: :private
      attribute :id, Integer, writer: :private

      def initialize(params = {})
        self.params = params.except(:id)
        self.id = params['id']
      end

      def call
        school = ::CMS::Schools::Find.call(id)

        if school.succeed?
          group = school.response.groups.create!(params)
        else
        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'School not found'  )
        end

        success group
      rescue ActiveRecord::RecordInvalid => e
        return error(response: e.record, title: ERROR_TITLE, code: 422,
                     message: 'school could not be created', errors: e.record.errors)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end
