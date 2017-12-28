module Tecnicopias
  module Client
    module V1
      class Base < Grape::API
        content_type :json, 'application/json'
        format :json
        default_format :json
      end
    end
  end
end
