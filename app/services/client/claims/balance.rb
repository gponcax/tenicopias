module Client
  module Claims
    class Balance < ::BaseService
      ERROR_TITLE = 'Balance Error'.freeze

      attribute :doc_id, Integer, writer: :private
      attribute :student, Object, writer: :private

      def initialize(student, doc_id)
        self.doc_id = doc_id
        self.student = student
      end

      def call

        wallet = ::Client::Wallets::Find.call(student.wallet.id)
        doc = ::Client::Docs::Find.call(doc_id)
        amount = doc.response.price
        balance = wallet.response.balance - amount
        new_balance = wallet.response.update!(balance: balance)

        if new_balance
          purchase = ::Client::Purchases::Create.call(amount, doc.response, student.id)
          if purchase.succeed?
              general_balance = ::Client::Balances::Create.call(amount)
              return error(
                title: ERROR_TITLE,
                code: 404,
                message: 'Balance could not be created'
              ) unless general_balance

            success purchase.response
          else
            return error(
              title: ERROR_TITLE,
              code: 404,
              message: 'Purchases could not be created'
            ) unless purchase

          end
        end

      rescue ActiveRecord::RecordInvalid => e
        return error(response: e.record,
                    title: ERROR_TITLE,
                    code: 422,
                    message: 'Balance could not be created',
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
