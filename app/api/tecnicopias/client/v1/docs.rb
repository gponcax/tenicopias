module Tecnicopias
  module  Client
    module V1
      class Docs < Base
        namespace :docs do
          before do
            doorkeeper_authorize! :student
          end

          desc 'Docs List'
          params do
            use :pagination
            optional :denied, allow_blank: true, type: Boolean
            optional :printed, allow_blank: true, type: Boolean
            optional :delivered, allow_blank: true, type: Boolean
            optional :approved, allow_blank: true, type: Boolean
          end

          get each_serializer: ::Client::Docs::DocSerializer do
            result = ::Client::Filters::DocByStatus.call(current_resource_owner, params)
            if result.succeed?
              paginate  result.response.page(params[:page]).per(params[:per_page])
            else
              []
            end
          end
        end
      end
    end
  end
end
