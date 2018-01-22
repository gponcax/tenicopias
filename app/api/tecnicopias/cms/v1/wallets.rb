module Tecnicopias
  module CMS
    module V1
      class Wallets < Base
        namespace :wallets do
          before do
            doorkeeper_authorize! :admin
          end

          desc 'Add Credit'
          params do
            requires :student_id, type: Integer, allow_blank: false
            requires :amount_money, type: Integer, allow_blank: false
          end
          put serializer: ::CMS::Wallets::WalletSerializer do
            status 204
            result = ::CMS::Wallets::Credit.call(params)
            if result.succeed?
              result.response
            else
              error!({  message: result.message,
                        errors: result.errors },
                        result.code)
            end
          end
        end
      end
    end
  end
end
