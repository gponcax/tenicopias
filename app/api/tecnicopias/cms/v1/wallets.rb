module Tecnicopias
  module CMS
    module V1
      class Wallets < Base
        namespace :wallet do
          before do
            doorkeeper_authorize! :admin
          end

          desc 'Balance'
          get do
            current_resource_owner
          end
        end
      end
    end
  end
end
