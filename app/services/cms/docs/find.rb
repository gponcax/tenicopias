module CMS
  module Docs
    class Find < ::BaseService
      ERROR_TITLE = 'Doc Error'.freeze

      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
      end

      def call
        doc = Doc.find_by(id: id)

        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Doc not found'
        ) unless doc

        success(doc)
      rescue => e
        return error(reponse: e,
                    title: ERROR_TITLE,
                    message: e.message,
                    code: 422)
      end
    end
  end
end
