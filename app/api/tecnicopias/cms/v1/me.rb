module Tecnicopias
  module CMS
    module V1
      class Me < Base
        namespace :me do
          before do
            doorkeeper_authorize! :admin, :printer, :teacher
          end

          desc 'Profile'
          get do
            current_resource_owner
          end
        end
      end
    end
  end
end
