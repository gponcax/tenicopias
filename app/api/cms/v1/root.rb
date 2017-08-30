module CMS
  module V1
    class Root < Grape::API
      version 'v1', using: :path
      prefix :cms

      helpers Doorkeeper::Grape::Helpers, CurrentResourceOwnerHelper

      mount CMS::V1::Admins
      mount CMS::V1::Oauth

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