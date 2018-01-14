module Tecnicopias
  module Client
    module V1
      class Root < Grape::API
        version 'v1', using: :path
        prefix :client

        helpers Doorkeeper::Grape::Helpers, CurrentResourceOwnerHelper
        mount ::Tecnicopias::Client::V1::Oauth
        mount ::Tecnicopias::Client::V1::Groups

        add_swagger_documentation mount_path: '/swagger_doc',
                                  base_path: '/',
                                  in: 'json',
                                  security_definitions: {
                                    api_key: {
                                      type: 'apiKey',
                                      name: 'Authorization',
                                      in: 'header'
                                    }
                                  }
      end
    end
  end
end
