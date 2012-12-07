# stop and delete the default site
iis_site 'Default Web Site' do
  action [:stop, :delete]
end

# create and start a new site that maps to
iis_site 'ARMBackend' do
  protocol :http
  port 80
  path "C:/BackendARM"
  host_header "arm.epam.com"
  action [:add,:start]
end

 #creates a new app pool
 iis_pool 'BackendARM' do
     runtime_version "4.0"
     pipeline_mode :Integrated
     action :add
 end

#creates a new app
iis_app "ARMBackend" do
    path "/ARM"
    application_pool "BackendARM"
    physical_path "C:/BackendARM"
    action :add
end