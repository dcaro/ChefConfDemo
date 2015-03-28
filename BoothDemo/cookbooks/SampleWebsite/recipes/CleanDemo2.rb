

directory 'c:\\boothdemo' do
	recursive true
	action :delete
end

dsc_resource 'Remove IIS' do
  resource :windowsfeature
  property :name ,'web-server'
  property :ensure ,'absent'
end


directory "c:\\inetpub" do
	recursive true
	action :delete
end

