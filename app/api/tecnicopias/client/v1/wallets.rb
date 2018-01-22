module Tecnicopias
  module Client
    module V1
      class Wallets < Base
        namespace :wallets do
          before do
            doorkeeper_authorize! :student
          end

          desc 'Add Credit'
          get serializer: ::Client::Wallets::WalletSerializer do
            current_resource_owner.wallet
          end
        end
      end
    end
  end
end
