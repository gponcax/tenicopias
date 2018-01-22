module CMS
  module Wallets
    class Credit < ::BaseService
      ERROR_TITLE = 'Wallet Error'.freeze

      attribute :student_id, Integer, writer: :private
      attribute :amount_money, Integer, writer: :private

      def initialize(params= {})
        self.student_id = params[:student_id]
        self.amount_money = params[:amount_money]
      end

      def call
        student = Student.find(student_id)
        wallet = student.wallet
        balance = wallet.balance + amount_money
        Wallet.transaction do
          new_credit = wallet.update!(balance: balance)
        end
        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Wallet not found'
        ) unless wallet

        success(wallet)
      end
    end
  end
end
