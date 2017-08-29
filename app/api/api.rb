class Api < Grape::API
  format :json
  formatter :json, Grape::Formatter::ActiveModelSerializers

  mount V1::Root
end