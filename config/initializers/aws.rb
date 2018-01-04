require 'aws-sdk'

Aws::VERSION =  Gem.loaded_specs['aws-sdk'].version
Aws.config.update(
  region: ENV.fetch('AWS_REGION'),
  credentials: Aws::Credentials.new(
    ENV.fetch('AWS_ACCESS_KEY_ID'),
    ENV.fetch('AWS_SECRET_ACCESS_KEY')
  )
)
