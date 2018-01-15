module Tecnicopias
  module CMS
    module V1
      class Students < Base
        namespace :students do
          before do
            doorkeeper_authorize! :admin
          end

          desc 'Create Student'
          params do
            requires :name, allow_blank: false, type: String
            requires :email, allow_blank: false, regexp: Devise::email_regexp, type: String
            optional :phone, allow_blank: false, type: String
            requires :password, allow_blank: false, type: String,
                     documentation: { type: 'password' }
            given :password do
              requires :password_confirmation, allow_blank: false, type: String,
                       documentation: { type: 'password' }
            end
          end
          post serializer: ::CMS::Students::StudentSerializer do
            status 201

            result = ::CMS::Students::Create.call(params)

            if result.succeed?
              result.response
            else
              error!({ message: result.message, errors: result.errors }, result.code)
            end
          end

          desc 'Student List'
          params do
            use :pagination
          end
          get each_serializer: ::CMS::Students::StudentSerializer do
            paginate Student.page(params[:page]).per(params[:per_page])
          end

          route_param :id, type: Integer, allow_blank: false do
            desc 'Student Detail'
            get serializer: ::CMS::Students::StudentSerializer do
              result = ::CMS::Students::Find.call(params[:id])

              if result.succeed?
                result.response
              else
                error!({ message: result.message, errors: result.errors }, result.code)
              end
            end

            desc 'Student Groups'
            namespace :groups do
              params do
                use :pagination
              end
              get serializer: ::CMS::Groups::GroupSerializer do
                result = ::CMS::Students::Groups.call(params[:id])
                if result.succeed?
                  paginate result.response
                else
                  error!({ message: result.message, errors: result.errors }, result.code)
                end
              end
            end


            desc 'Update Student'
            params do
              optional :name, allow_blank: false, type: String
              optional :email, allow_blank: false, regexp: Devise::email_regexp, type: String
              optional :phone, allow_blank: false, type: String
              optional :password, allow_blank: false, type: String,
                       documentation: { type: 'password', required: false }
              given :password do
                requires :password_confirmation, allow_blank: false, type: String,
                         documentation: { type: 'password', required: false }
              end
            end
            put do
              status 204

              result = ::CMS::Students::Update.call(params)

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end

            desc 'Delete Students'
            delete do
              status 204

              result = ::CMS::Students::Delete.call(params[:id])

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end
          end
        end
      end
    end
  end
end
