module Tecnicopias
  module  Client
    module V1
      class Claims < Base
        namespace :claims do
          before do
            doorkeeper_authorize! :student
          end

          desc 'Claim List'
          params do
            use :pagination
            optional :denied, allow_blank: true, type: Boolean
            optional :printed, allow_blank: true, type: Boolean
            optional :delivered, allow_blank: true, type: Boolean
            optional :approved, allow_blank: true, type: Boolean
          end

          get each_serializer: ::Client::Claims::ClaimSerializer do
            result = ::Client::Filters::ClaimsByStatus.call(current_resource_owner, params)
            if result.succeed?
              paginate  result.response.page(params[:page]).per(params[:per_page])
            else
              []
            end
          end

          desc 'Create Claims'
          params do
            requires :doc_id, allow_blank: false, type: Integer
          end

          post serializer: ::Client::Claims::ClaimSerializer do
            status 201

            result = ::Client::Claims::Create.call(current_resource_owner, params)

            if result.succeed?
              result.response
            else
              error!({ message: result.message, errors: result.errors }, result.code)
            end
          end
        end
      end
    end
  end
end
