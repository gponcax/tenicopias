module Client
  module V1
    class Users < Base
      namespace :users do
        desc 'User List'
        get do
          []
        end
      end
    end
  end
end