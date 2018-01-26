module Client
  module Filters
    class ClaimsByStatus < ::BaseService
      ERROR_TITLE = 'Claims Error'.freeze

      attribute :params,  ActionController::Parameters, writer: :private

      def initialize(params={})
        self.params = params
      end

      def call
        if params[:denied]
          claims = Claim.where(denied: params[:denied])
        elsif params[:printed]
          claims = Claim.where(printed: params[:printed])
        elsif params[:delivered]
          claims = Claim.where(delivered: params[:delivered])
        elsif params[:approved]
          claims = Claim.where(approved: params[:approved])
        else
          claims = Claim.where(sent: true)
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
