module Tecnicopias
  module  Client
    module V1
      class Groups < Base
        namespace :groups do
          before do
            doorkeeper_authorize! :student
          end

          desc 'Group List'
          params do
            use :pagination
          end

          get each_serializer: ::CMS::Groups::GroupSerializer do
            paginate  Group.page(params[:page]).per(params[:per_page])
          end
          
          route_param :id, type: Integer, allow_blank: false, requirements: { id: /[0-9]*/ } do
            desc 'Group Detail'
            get serializer: ::CMS::Groups::GroupSerializer do
              result = ::CMS::Groups::Find.call(params[:id])

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
end
