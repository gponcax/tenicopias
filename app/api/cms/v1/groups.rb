module CMS
  module V1
    class Groups < Base
      namespace :groups do
        before do
          doorkeeper_authorize! :admin
        end

        desc 'Login'

        desc 'Create Group'
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
        post serializer: ::CMS::Groups::GroupSerializer do
          status 201

          result = ::CMS::Groups::Create.call(params)

          if result.succeed?
            result.response
          else
            error!({ message: result.message, errors: result.errors }, result.code)
          end
        end

        desc 'Group List'
        get each_serializer: ::CMS::Groups::GroupSerializer do
          Group.all
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
