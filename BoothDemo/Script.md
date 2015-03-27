Open Powershell in C:\Demo\ChefConfDemo\BoothDemo

#On BOOTH VM1 
##Demo 1:
Create a file using a dsc script (be careful, case sensitive)
chef-client -z -o 'SampleWebsite::DemoFile'

##Demo 2:
Deploy a website using DSC only 
chef-client -z -o 'SampleWebsite::SimpleDSCWeb'

##Demo 3:
Deploy website using DSC and resource kit modules
chef-client -z -o 'SampleWebsite::SimpleWeb'

##Clean Demo Environement 
chef-client -z -o 'SampleWebsite::CleanDemo'


#On BOOTH VM2 
#Demo 1
Create a file using dsc_resource resource from chef
chef-client -z -o 'SampleWebsite::SimpleWeb'

#Demo 2
Create a Website using dsc_resource resource from chef
chef-client -z -o 'SampleWebsite::SimpleWeb'

#Demo 3
Create the bakery website using the Bakrey website 
chef-client -z -o 'SampleWebsite::Bakery'

