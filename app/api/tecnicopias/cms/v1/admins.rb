module Tecnicopias
  module CMS
    module V1
      class Admins < Base
        namespace :admins do
          before do
            doorkeeper_authorize! :admin
          end

          desc 'Create Admin'
          params do
            requires :name, allow_blank: false, type: String
            requires :email, allow_blank: false, regexp: Devise::email_regexp, type: String
            requires :password, allow_blank: false, type: String,
                     documentation: { required: false, type: 'password' }
            given :password do
              requires :password_confirmation, allow_blank: false, type: String,
                       documentation: { required: false, type: 'password' }
            end
          end
          post serializer: ::CMS::Admins::AdminSerializer do
            status 201

            result = ::CMS::Admins::Create.call(params)

            if result.succeed?
              result.response
            else
              error!({ message: result.message, errors: result.errors }, result.code)
            end
          end

          desc 'Admin List'
          params do
            use :pagination
          end
          get each_serializer: ::CMS::Admins::AdminSerializer do
            paginate Admin.page(params[:page]).per(params[:per_page])
          end

          route_param :id, type: Integer, allow_blank: false, requirements: { id: /[0-9]*/ } do
            desc 'Admin Detail'
            get serializer: ::CMS::Admins::AdminSerializer do
              result = ::CMS::Admins::Find.call(params[:id])

              if result.succeed?
                result.response
              else
                error!({ message: result.message, errors: result.errors }, result.code)
              end
            end

            desc 'Update Admin'
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
              result = ::CMS::Admins::Update.call(params)

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end

            desc 'Delete Admin'
            delete do
              status 204

              result = ::CMS::Admins::Delete.call(params[:id])

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end
          end
        end
      end
    end
  end
end
