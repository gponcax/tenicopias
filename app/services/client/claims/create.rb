module Client
  module Claims
    class Create < ::BaseService
      ERROR_TITLE = 'Claim Error'.freeze
      attribute :params, Hash, writer: :private
      attribute :student, Object, writer: :private

      def initialize(student, params = {})
        self.params = params
        self.student = student
      end

      def call
        claim = student.claims.create!(params)

        if claim
          balance = ::Client::Claims::Balance.call(student, claim.doc_id)
          success(claim)
        else
          return error(
                        title: ERROR_TITLE,
                        code: 404,
                        message: 'claim could not be created'
                        )
        end

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
