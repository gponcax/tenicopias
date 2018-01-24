module CMS
  module Claims
    class ChangeStatus < ::BaseService
      ERROR_TITLE = 'Course Error'.freeze

      attribute :id, Integer, writer: :private
      attribute :params, Hash, writer: :private
      attribute :user_id, Integer, writer: :private
      attribute :user, Object, writer: :private

      def initialize(user, params ={})
        self.id = params[:id]
        self.user_id = user.id
        self.params = params
        self.user = user
      end

      def call
        claim = Claim.find(id)
        update_status = claim.update!(
                          denied: params["denied"],
                          printed: params["printed"],
                          delivered: params["delivered"],
                          approved: params["approved"])
      if update_status
        user.token.scopes_string
        status = claim.statuses.create!(user_id: user_id,
                                      denied: params["denied"],
                                      printed: params["printed"],
                                      delivered: params["delivered"],
                                      approved: params["approved"],
                                      scope:   user.token.scopes_string
                                      )
      end
        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Claim not found'
        ) unless claim

        success(claim)

       rescue ActiveRecord::RecordInvalid => e
         return error(
                        response: e.record,
                        title: ERROR_TITLE, code: 422,
                        message: 'Doc could not be added',
                        errors: e.record.errors
                      )
       rescue => e
         return error(
                        response: e,
                        title: ERROR_TITLE,
                        message: e.message,
                        code: 422
                      )
      end
    end
  end
end
