module Tecnicopias
  module CMS
    module V1
      class Printers < Base
        namespace :printers do
          before do
            doorkeeper_authorize! :admin
          end

          desc 'Create Printer'
          params do
            requires :name, allow_blank: false, type: String
            requires :email, allow_blank: false, regexp: Devise::email_regexp, type: String
            requires :password, allow_blank: false, type: String,
                     documentation: { type: 'password' }
            given :password do
              requires :password_confirmation, allow_blank: false, type: String,
                       documentation: { type: 'password' }
            end
          end
          post serializer: ::CMS::Printers::PrinterSerializer do
            status 201

            result = ::CMS::Printers::Create.call(params)

            if result.succeed?
              result.response
            else
              error!({ message: result.message, errors: result.errors }, result.code)
            end
          end

          desc 'Printer List'
          params do
            use :pagination
          end
          get each_serializer: ::CMS::Printers::PrinterSerializer do
            paginate Printer.page(params[:page]).per(params[:per_page])
          end

          route_param :id, type: Integer, allow_blank: false do
            desc 'Printer Detail'
            get serializer: ::CMS::Printers::PrinterSerializer do
              result = ::CMS::Printers::Find.call(params[:id])

              if result.succeed?
                result.response
              else
                error!({ message: result.message, errors: result.errors }, result.code)
              end
            end

            desc 'Update Printer'
            params do
              optional :name, allow_blank: false, type: String
              optional :email, allow_blank: false, regexp: Devise::email_regexp, type: String
              optional :password, allow_blank: false, type: String,
                       documentation: { type: 'password', required: false }
              given :password do
                requires :password_confirmation, allow_blank: false, type: String,
                         documentation: { type: 'password', required: false }
              end
            end
            put do
              status 204

              result = ::CMS::Printers::Update.call(params)

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end

            desc 'Delete Printer'
            delete do
              status 204

              result = ::CMS::Printers::Delete.call(params[:id])

              error!({ message: result.message, errors: result.errors },
                     result.code) unless result.succeed?
            end
          end
        end
      end
    end
  end
end
