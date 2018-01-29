module CMS
  module Admins
    class Find < ::BaseService

      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
      end

      def call
        admin = Admin.find_by(id: id)

        return error(
          title: 'Admin Error',
          code: 404,
          message: 'Admin not found'
        ) unless admin

        success(admin)
      rescue => e
        return error(reponse: e, title: 'Admin Error', message: e.message, code: 422)
      end
    end
  end
end
