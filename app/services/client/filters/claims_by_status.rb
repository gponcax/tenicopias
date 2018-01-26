module Client
  module Filters
    class ClaimsByStatus < ::BaseService
      ERROR_TITLE = 'Claims Error'.freeze

      attribute :params,  ActionController::Parameters, writer: :private
      attribute :user, Object, writer: :private

      def initialize(user, params={})
        self.params = params
        self.user = user
      end

      def call
        if params[:denied]
          claims = user.claims.where(denied: params[:denied])
        elsif params[:printed]
          claims = user.claims.where(printed: params[:printed])
        elsif params[:delivered]
          claims = user.claims.where(delivered: params[:delivered])
        elsif params[:approved]
          claims = user.claims.where(approved: params[:approved])
        else
          claims = user.claims.where(sent: true)
        end

        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Claims not found'
        ) unless claims.present?

        success(claims)
      rescue => e
        return error(reponse: e, title: ERROR_TITLE, message: e.message, code: 422)
      end
    end
  end
end
