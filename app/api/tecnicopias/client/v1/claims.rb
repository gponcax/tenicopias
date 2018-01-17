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
          end

          get each_serializer: ::Client::Claims::ClaimSerializer do
            paginate  current_resource_owner.claims.page(params[:page]).per(params[:per_page])
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
