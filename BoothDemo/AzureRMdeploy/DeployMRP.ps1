﻿
#### Deployment of MRP ######
$RGName = "MRPRG"
New-AzureResourceGroup -Name $RGName -Location 'West US'
New-AzureResourceGroupDeployment -Name mrpdeploy -ResourceGroupName $RGName -TemplateFile '.\DeployMRP-CSE.json' -TemplateParameterFile '.\DeployMRP-CSE - parameters.json' -Verbose
Get-AzurePublicIpAddress -ResourceGroupName $RGName
Remove-AzureResourceGroup "MRPRG"
