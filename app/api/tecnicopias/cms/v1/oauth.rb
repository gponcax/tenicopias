module Tecnicopias
  module CMS
    module V1
      class Oauth < Base
        namespace :oauth do
          desc 'Requires for an access token'
          params do
            requires :grant_type,
                     type: String,
                     allow_blank: false,
                     values: %w(password)
            requires :email,
                     type: String,
                     regexp: Devise::email_regexp,
                     allow_blank: false
            requires :password,
                     type: String,
                     allow_blank: false,
                     documentation: { type: 'password' }
            requires :scope,
                     type: String,
                     allow_blank: false,
                     values: %w(admin teacher copy)
          end
          post :token do
          end
        end
      end
    end
  end
end
