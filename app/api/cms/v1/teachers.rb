module CMS
  module V1
    class Teachers < Base
      namespace :teachers do
        before do
          doorkeeper_authorize! :admin
        end

        desc 'Create Teacher'
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
        post serializer: ::CMS::Teachers::TeacherSerializer do
          status 201

          result = ::CMS::Teachers::Create.call(params)

          if result.succeed?
            result.response
          else
            error!({ message: result.message, errors: result.errors }, result.code)
          end
        end

        desc 'Teacher List'
        get each_serializer: ::CMS::Teachers::TeacherSerializer do
          Teacher.all
        end

        route_param :id, type: Integer, allow_blank: false do
          desc 'Teacher Detail'
          get serializer: ::CMS::Teachers::TeacherSerializer do
            result = ::CMS::Teachers::Find.call(params[:id])

            if result.succeed?
              result.response
            else
              error!({ message: result.message, errors: result.errors }, result.code)
            end
          end

          desc 'Update Teacher'
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

            result = ::CMS::Teachers::Update.call(params)

            error!({ message: result.message, errors: result.errors },
                   result.code) unless result.succeed?
          end

          desc 'Delete Teacher'
          delete do
            status 204

            result = ::CMS::Teachers::Delete.call(params[:id])

            error!({ message: result.message, errors: result.errors },
                   result.code) unless result.succeed?
          end
        end
      end
    end
  end
end