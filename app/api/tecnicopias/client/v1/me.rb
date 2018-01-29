module Tecnicopias
  module Client
    module V1
      class Me < Base
        namespace :me do
          before do
            doorkeeper_authorize! :student
          end

          desc 'Profile'
          get serializer: ::Client::Students::MeSerializer do
            current_resource_owner
          end

          namespace :me_teacher do
            desc 'Update Teacher'
            params do
              optional :name, allow_blank: false, type: String
              optional :email, allow_blank: false, regexp: Devise::email_regexp, type: String
              optional :phone, allow_blank: false, type: String
              optional :birthdate, allow_blank: false, type: Date
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
          end

        end
      end
    end
  end
end
