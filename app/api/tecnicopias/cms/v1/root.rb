module Tecnicopias
  module CMS
    module V1
      class Root < Grape::API
        version 'v1', using: :path
        prefix :cms

        helpers Doorkeeper::Grape::Helpers, CurrentResourceOwnerHelper

        mount ::Tecnicopias::CMS::V1::Admins
        mount ::Tecnicopias::CMS::V1::Teachers
        mount ::Tecnicopias::CMS::V1::Students
        mount ::Tecnicopias::CMS::V1::Oauth
        mount ::Tecnicopias::CMS::V1::Printers
        # mount ::Tecnicopias::CMS::V1::Groups
        mount ::Tecnicopias::CMS::V1::Docs
        mount ::Tecnicopias::CMS::V1::Courses
        mount ::Tecnicopias::CMS::V1::Me
        mount ::Tecnicopias::CMS::V1::Claims


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
