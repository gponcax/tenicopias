module CMS
  module Groups
    class Find < ::BaseService
      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
      end

      def call
        admin = Group.find_by(id: id)

        return error(
          title: 'Group Error',
          code: 404,
          message: 'Group not found'
        ) unless admin

        success(admin)
      rescue => e
        return error(reponse: e, title: 'Group Error', message: e.message, code: 422)
      end
    end
  end
end
