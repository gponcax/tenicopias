module V1
  class Root < Grape::API
    version 'v1', using: :path
  end
end