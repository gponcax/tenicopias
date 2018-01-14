module Tecnicopias
  module Client
    module V1
      class Base < Grape::API
        content_type :json, 'application/json'
        format :json
        default_format :json
        
        helpers Doorkeeper::Grape::Helpers,
        Tecnicopias::CurrentResourceOwnerHelper,
        Tecnicopias::SharedParams
      end
    end
  end
end
