CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
                              provider:              'AWS', # required
                              aws_access_key_id:     'S3_KEY', # required
                              aws_secret_access_key: 'S3_ACCESS_TOKEN' # required
                            }
  config.fog_directory  = 'name_of_directory'# required
  config.fog_public     = false   # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" } # optional, defaults to {}
end
