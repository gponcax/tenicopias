module Client
  module Purchases
    class Create < ::BaseService
      ERROR_TITLE = 'Purchase Error'.freeze
      attribute :amount, Integer, writer: :private
      attribute :student_id, Integer, writer: :private
      attribute :doc, Object, writer: :private

      def initialize(amount, doc, student_id)
        self.amount = amount
        self.doc = doc
        self.student_id = student_id
      end

      def call
        balance_id =  Balance.first.id
        purchase = doc.purchases.create!(amount: amount,
                                        student_id: student_id,
                                        balance_id: balance_id)
        return error(
          title: ERROR_TITLE,
          code: 404,
          message: 'Balance could not be created'
        ) unless purchase

        success(purchase)

      rescue ActiveRecord::RecordInvalid => e
        return error(response: e.record,
                    title: ERROR_TITLE,
                    code: 422,
                    message: 'Purchase could not be created',
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
