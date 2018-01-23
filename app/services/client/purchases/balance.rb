module Client
  module Purchases
    class Balance < ::BaseService
      attribute :params, Hash, writer: :private
      attribute :doc_id, Integer, writer: :private


      def initialize(params = {})
        self.params = params
        self.doc_id = params[:doc_id]
      end

      def call
        doc = ::Client::Docs::Find.call(doc_id)
        
        price = doc.response.price
        balance =
        success claim

      rescue ActiveRecord::RecordInvalid => e
        return error(response: e.record,
                    title: ERROR_TITLE,
                    code: 422,
                    message: 'Claim could not be created',
                    errors: e.record.errors)
      rescue => e
        return error(reponse: e,
                    title: ERROR_TITLE,
                    message: e.message,
                    code: 422)
      end
    end
  end
end
