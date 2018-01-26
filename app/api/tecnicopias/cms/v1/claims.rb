module Tecnicopias
  module  CMS
    module V1
      class Claims < Base
        namespace :claims do
          before do
            doorkeeper_authorize! :admin, :printer
          end

          desc 'Claim List'
          params do
            use :pagination
            optional :denied, allow_blank: true, type: Boolean
            optional :printed, allow_blank: true, type: Boolean
            optional :delivered, allow_blank: true, type: Boolean
            optional :approved, allow_blank: true, type: Boolean
          end

          get each_serializer: ::CMS::Claims::ClaimSerializer do
            result = ::CMS::Filters::ClaimsByStatus.call(params)
            if result.succeed?
              paginate  result.response.page(params[:page]).per(params[:per_page])
            else
            error!({ message: result.message, errors: result.errors },
                   result.code)
            end
          end

          route_param :id, type: Integer, allow_blank: false, requirements: { id: /[0-9]*/ } do

            desc 'ChangeSatus'
            params do
              optional :denied, allow_blank: true, type: Boolean
              optional :printed, allow_blank: true, type: Boolean
              optional :delivered, allow_blank: true, type: Boolean
              optional :approved, allow_blank: true, type: Boolean
            end
            put do
              status 204

              result = ::CMS::Claims::ChangeStatus.call(current_resource_owner,
                                                        params)

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end
          end

        end
      end
    end
  end
end
