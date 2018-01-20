module Client
  module Claims
    class Balance < ::BaseService
      ERROR_TITLE = 'Balance Error'.freeze

      attribute :params, Hash, writer: :private
      attribute :student, Object, writer: :private

      def initialize(student, params = {})
        self.params = params
        self.student = student
      end

      def call
        wallet = ::Client::Wallets::Find.call(student.wallet.id)

        doc = ::Client::Docs::Find.call(params)

        amount = doc.response.price

        balance = wallet.response.balance - amount

        new_balance = wallet.response.update!(balance: balance)

        success new_balance

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
