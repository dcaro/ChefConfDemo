
dsc_resource 'Install IIS' do
  resource :windowsfeature
  property :name,  'web-server'
end

