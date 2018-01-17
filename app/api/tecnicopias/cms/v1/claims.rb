module Tecnicopias
  module  CMS
    module V1
      class Claims < Base
        namespace :claims do
          before do
            doorkeeper_authorize! :admin
          end

          desc 'Claim List'
          params do
            use :pagination
          end

          get each_serializer: ::CMS::Claims::ClaimSerializer do
            paginate  Claim.all.page(params[:page]).per(params[:per_page])
          end

          
        end
      end
    end
  end
end
