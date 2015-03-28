# Deploy Chef VM 
#### Deployment of MRP ######
$RGName = "ChefBooth1"
$DeploymentName = "ChefBoothDeploy1"
New-AzureResourceGroup -Name $RGName -Location 'West US'
New-AzureResourceGroupDeployment -Name chefdeploy1 -ResourceGroupName $RGName -TemplateFile '.\DeployWebApp.json' -TemplateParameterFile '.\DeployWebApp.parameters.json' -Verbose
Get-AzurePublicIpAddress -ResourceGroupName $RGName

Remove-AzureResourceGroup "ChefBooth1"
