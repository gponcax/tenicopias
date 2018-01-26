module Client
  module Filters
    class DocByStatus < ::BaseService
      ERROR_TITLE = 'Doc Error'.freeze

      attribute :params,  ActionController::Parameters, writer: :private
      attribute :user, Object, writer: :private

      def initialize(user, params={})
        self.params = params
        self.user = user
      end

      def call
        if params[:denied]
          claims = user.docs.where("claims.denied", true)
        elsif params[:printed]
          claims = user.docs.where("claims.printed", true)
        elsif params[:delivered]
          claims = user.docs.where("claims.delivered", true)
        elsif params[:approved]
          claims = user.docs.where("claims.approved", true)
        else
          claims = user.docs
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
