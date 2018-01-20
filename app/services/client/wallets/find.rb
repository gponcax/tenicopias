module Client
  module Wallets
    class Find < ::BaseService
      ERROR_TITLE = 'Wallet Error'.freeze

      attribute :id, Integer, writer: :private

      def initialize(id)
        self.id = id
      end

      def call
        wallet = Wallet.find(id)
        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Wallet not found'
        ) unless wallet

        success wallet
      rescue => e
        return error(reponse: e,
                    title: ERROR_TITLE,
                    message: e.message,
                    code: 422)
      end
    end
  end
end
