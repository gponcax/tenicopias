module CMS
  module Wallets
    class Balance < ::BaseService
      ERROR_TITLE = 'Wallet Error'.freeze

      attribute :student_id, Integer, writer: :private
    
      def initialize(student_id)
        self.student_id = student_id
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
          message: 'Wallet not found'
        ) unless new_credit

        success(wallet)
      end
    end
  end
end
