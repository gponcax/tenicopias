module Client
  module Wallets
    class WalletSerializer < ActiveModel::Serializer
      attributes :id, :balance

      def created_at
        object.created_at.iso8601
      end

      def balance
        currency = Money.new(object.balance, "USD").format
      end
    end
  end
end
