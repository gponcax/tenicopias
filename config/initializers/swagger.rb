GrapeSwaggerRails.options.before_action do |request|
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port

  if request.path.match('/apidoc-cms/').present?
    GrapeSwaggerRails.options.url = '/cms/v1/swagger_doc.json'
  else
    GrapeSwaggerRails.options.url = '/v1/swagger_doc.json'
  end
end

GrapeSwaggerRails.options.api_auth     = 'bearer'
GrapeSwaggerRails.options.api_key_name = 'Authorization'
GrapeSwaggerRails.options.api_key_type = 'header'