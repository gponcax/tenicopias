module Tecnicopias
  module CMS
    module V1
      class Docs < Base
        namespace :docs do
          before do
            doorkeeper_authorize! :admin
          end
          desc 'Doc List'
          params do
            use :pagination
          end
          get each_serializer: ::CMS::Docs::DocSerializer do
            paginate Doc.page(params[:page]).per(params[:per_page])
          end

          route_param :id, type: Integer, allow_blank: false, requirements: { id: /[0-9]*/ } do
            desc 'Doc Detail'
            get serializer: ::CMS::Docs::DocSerializer do
              result = ::Client::Docs::Find.call(params[:id])

              if result.succeed?
                result.response
              else
                error!({ message: result.message, errors: result.errors }, result.code)
              end
            end

            desc 'Update Doc'
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

              result = ::CMS::Docs::Update.call(params)

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end

            desc 'Delete Doc'
            delete do
              status 204

              result = ::CMS::Docs::Delete.call(params[:id])

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end
          end
          namespace :courses do
            route_param :id, allow_blank: false, type: Integer do

              desc 'Create Doc'
              params do
                requires :name, allow_blank: false, type: String
                requires :description, allow_blank: false, type: String
                requires :price, allow_blank: false, type: Integer
                requires :page_numbers, allow_blank: false, type: Integer
                requires :document, allow_blank: false, type: File
              end
              post serializer: ::CMS::Docs::DocSerializer do
                status 201
                result = ::CMS::Docs::Create.call(params)
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
end
