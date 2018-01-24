module Client
  module Balances
    class Create < ::BaseService
      ERROR_TITLE = 'Claim Error'.freeze
      attribute :amount, Integer, writer: :private

      def initialize(amount)
        self.amount = amount
      end

      def call
        balance = Balance.first
        old_total_amount = balance.total_amount
        new_total_amount = old_total_amount + amount
        balance.update!(total_amount: new_total_amount)
        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Balance could not be created'
        ) unless balance

        success(balance)

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
