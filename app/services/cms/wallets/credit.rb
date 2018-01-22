module CMS
  module Wallets
    class Credit < ::BaseService
      ERROR_TITLE = 'Course Error'.freeze

      attribute :student_id, Integer, writer: :private
      attribute :amount_money. Integer, writer: :private

      def initialize(student_id, amount_money)
        self.student_id = student_id
        self.amount_money = amount_money
      end

      def call
        student = User.find(student_id)
        wallet = student.wallet
        Wallet.transaction do
          new_credit = wallet.update!(balance: amount_money)
        end
        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Course not found'
        ) unless new_credit

        success(wallet)
      end
    end
  end
end
