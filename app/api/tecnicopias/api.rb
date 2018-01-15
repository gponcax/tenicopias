require 'doorkeeper/grape/helpers'
require 'grape-swagger'
module Tecnicopias
  ADMIN = 'admin'.freeze
  TEACHER = 'teacher'.freeze
  PRINTER = 'printer'.freeze
  STUDENT = 'student'.freeze

  module CurrentResourceOwnerHelper
    def current_resource_owner
      return unless doorkeeper_token

      case doorkeeper_token.scopes.first
        when ADMIN
          Admin.find(doorkeeper_token.resource_owner_id)
        when TEACHER
          Teacher.find(doorkeeper_token.resource_owner_id)
        when PRINTER
          Printer.find(doorkeeper_token.resource_owner_id)
        when STUDENT
          Student.find(doorkeeper_token.resource_owner_id)
      end
    end
  end

  module SharedParams
    extend Grape::API::Helpers

    params :pagination do
      optional :page, type: Integer, allow_blank: false
      optional :per_page, type: Integer, allow_blank: false
    end
  end

  class Api < Grape::API
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    mount ::Tecnicopias::Client::V1::Root
    mount ::Tecnicopias::CMS::V1::Root
  end
end
