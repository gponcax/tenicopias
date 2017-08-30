module CMS
  module Admins
    class Find < ::BaseService
      ERROR_TITLE = 'Admin Error'.freeze

      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
      end

      def call
        admin = Admin.find_by(id: id)

        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Admin not found'
        ) unless admin

        success(admin)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end