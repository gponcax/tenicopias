require 'doorkeeper/grape/helpers'
require 'grape-swagger'

module Tecnicopias
  module CurrentResourceOwnerHelper
    def current_resource_owner
      return unless doorkeeper_token

      case doorkeeper_token.scopes.first
        when 'admin'
          Admin.find(doorkeeper_token.resource_owner_id)
      end
    end
  end

  class Api < Grape::API
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    mount ::Tecnicopias::Client::V1::Root
    mount ::Tecnicopias::CMS::V1::Root
  end
end
