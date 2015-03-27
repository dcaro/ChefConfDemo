
dsc_resource 'My Demo File' do 
	resource :File
	property :destinationpath, "c:\\demofile\\HelloWorld.txt"
	property :contents, "Hello World DCS_Resource"
	property :ensure, "Present"
end