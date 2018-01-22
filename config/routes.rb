Rails.application.routes.draw do

  scope 'client/v1' do
    use_doorkeeper do
      skip_controllers :applications, :authorized_applications, :authorizations
    end
  end

  scope 'cms/v1' do
    use_doorkeeper do
      skip_controllers :applications, :authorized_applications, :authorizations
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Tecnicopias::Api => '/'
  mount GrapeSwaggerRails::Engine => '/*apidoc'
end
