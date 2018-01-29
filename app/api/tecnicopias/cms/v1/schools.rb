module Tecnicopias
  module CMS
    module V1
      class Schools < Base
        namespace :careers do
          before do
            doorkeeper_authorize! :admin
          end

          desc 'Create School'
          params do
            requires :name, allow_blank: false, type: String
          end
          post serializer: ::CMS::Schools::SchoolSerializer do
            status 201
            result = ::CMS::Schools::Create.call(params)

            if result.succeed?
              result.response
            else
              error!({ message: result.message, errors: result.errors }, result.code)
            end
          end

          desc 'School List'
          params do
            use :pagination
          end
          get each_serializer: ::CMS::Schools::SchoolSerializer do
            paginate School.page(params[:page]).per(params[:per_page])
          end

          route_param :id, type: Integer, allow_blank: false, requirements: { id: /[0-9]*/ } do
            namespace :ciclo do
              desc 'Create Ciclo'
              params do
                requires :name, allow_blank: false, type: String
                requires :semester, allow_blank: false, type: Integer, values: [1,2]
              end
              post each_serializer: ::CMS::Schools::SchoolSerializer do
                status 201
                result = ::CMS::Schools::CreateGroups.call(params)

                if result.succeed?
                  result.response
                else
                  error!({ message: result.message, errors: result.errors }, result.code)
                end
              end

              params do
                use :pagination
              end

              desc 'All Ciclos by career'
              get serializer: ::CMS::Groups::GroupSerializer do
                result = ::CMS::Schools::Find.call(params[:id])

                if result.succeed?
                  result.response.groups
                else
                  error!({ message: result.message, errors: result.errors }, result.code)
                end
              end
            end

            desc 'School Detail'
            get serializer: ::CMS::Schools::SchoolSerializer do
              result = ::CMS::Schools::Find.call(params[:id])

              if result.succeed?
                result.response
              else
                error!({ message: result.message, errors: result.errors }, result.code)
              end
            end

            desc 'Update School'
            params do
              optional :name, allow_blank: false, type: String
              optional :email, allow_blank: false, regexp: Devise::email_regexp, type: String
              optional :password, allow_blank: false, type: String,
                       documentation: { required: false, type: 'password' }
              given :password do
                requires :password_confirmation, allow_blank: false, type: String,
                         documentation: { required: false, type: 'password' }
              end
            end
            put do
              status 204
              result = ::CMS::Schools::Update.call(params)

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end

            desc 'Delete School'
            delete do
              status 204

              result = ::CMS::Schools::Delete.call(params[:id])

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end
          end
        end
      end
    end
  end
end
