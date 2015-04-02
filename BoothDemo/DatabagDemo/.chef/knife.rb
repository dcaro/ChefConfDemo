# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "dcaro"
client_key               "#{current_dir}/dcaro.pem"
validation_client_name   "dpedemo-validator"
validation_key           "#{current_dir}/dpedemo-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/dpedemo"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]

knife[:editor] = '"C:\Program Files (x86)\Notepad++\notepad++.exe" -nosession -multiInst'

# Azure configuration
knife[:azure_subscription_id]  = '0c3a2f71-4128-4509-8719-3b16f291ad5f'
knife[:azure_publish_settings_file]		   = 'c:\demo\Windows Azure Internal Consumption-9-13-2013-credentials.publishsettings'
knife[:azure_api_host_name]    = 'management.core.windows.net'



