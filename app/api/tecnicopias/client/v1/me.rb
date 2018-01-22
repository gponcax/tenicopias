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
        end
      end
    end
  end
end
