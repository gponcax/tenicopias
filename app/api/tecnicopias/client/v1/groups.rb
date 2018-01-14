module Tecnicopias
  module  Client
    module V1
      class Groups < Base
        namespace :groups do
          before do
            doorkeeper_authorize! :admin
          end

          desc 'Group List'
          params do
            use :pagination
          end

          get each_serializer: ::CMS::Groups::GroupSerializer do
            paginate  Group.page(params[:page]).per(params[:per_page])
          end


          desc 'Create Group'
          params do
            requires :name, allow_blank: false, type: String
            requires :description, allow_blank: false, type: String
          end
          post serializer: ::CMS::Groups::GroupSerializer do
            status 201

            result = ::CMS::Groups::Create.call(params)

            if result.succeed?
              result.response
            else
              error!({ message: result.message, errors: result.errors }, result.code)
            end
          end

          route_param :group_id, allow_blank: false, type: Integer do
            namespace :docs do
              desc 'Add new Doc'
              params do
                requires :description, type: String, allow_blank: false
                requires :name, type: String, allow_blank: false
                requires :document, type: File, allow_blank: false
              end
              post serializer: ::CMS::Groups::GroupSerializer do
                status 201
                result = ::CMS::Groups::AddDoc.call(params)

                if result.succeed?
                  result.response
                else
                  error!(
                          {
                            message: result.message,
                            errors: result.errors
                          }, result.code
                        )
                end
              end
            end
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

            desc 'Update Group'
            params do
              requires :name, allow_blank: false, type: String
              requires :description, allow_blank: false, type: String
            end
            put do
              status 204

              result = ::CMS::Groups::Update.call(params)

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end

            desc 'Delete Group'
            delete do
              status 204

              result = ::CMS::Groups::Delete.call(params[:id])

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end
          end
        end
      end
    end
  end
end
