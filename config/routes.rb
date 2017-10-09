Rails.application.routes.draw do
  
  scope 'v1' do
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
  mount Api => '/'
  mount GrapeSwaggerRails::Engine => '/*apidoc'
end
