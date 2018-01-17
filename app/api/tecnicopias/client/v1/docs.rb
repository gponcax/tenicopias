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
          end

          get each_serializer: ::Client::Docs::DocSerializer do
            paginate  current_resource_owner.docs.page(params[:page]).per(params[:per_page])
          end
        end
      end
    end
  end
end
