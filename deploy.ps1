param(
 [string]$subscriptionId = "ce5a88da-12f9-4c6b-9a72-63b281ba8d1a",
 [string]$ResourceGroupName1,
 [string]$RG ="ADB-RAM-Test-",
 [array]$armRegion,
 [string]$templateFilePath = ".\azuredeploy.json",
 [string]$parametersFilePath = ".\azuredeploy.parameters.json"
 )


 Set-AzContext -SubscriptionId "$subscriptionId"
 
 Write-Output "Starting deployment...";
    
$armRegion = @("westeurope"
#,"eastus2"
#,"northeurope"
#,"australiacentral"
#,"centralus"
#,"Westus"
#,"southeastasia"
#,"eastus"
#,"southcentralus"
#,"australiasoutheast"
#,"japaneast"
#,"ukwest"
#,"centralindia"
#,"australiaeast"
#,"southindia"
#,"northcentralus"
#,"Koreacentral"
#,"eastAsia"
#,"uksouth"
#,"canadacentral"
#,"canadaeast"
,"japanwest"
,"westIndia"
,"southafricanorth"
,"brazilsouth"
,"francecentral", "francecentral")
#,"uaenorth","uaenorth"


   

    ForEach  ($region in $armRegion)
    {

      Write-Output "RG creation started in $region"
     "##--------------------------------------------------------------------##################"
     $ResourceGroupName1 = "$RG" + "$region"
      New-AzResourceGroup -Name "$ResourceGroupName1" -Location "$region" -Force;
     #Remove-AzResourceGroup -Name "$ResourceGroupName1" -AsJob -Force
     Write-Output "RG creation ended in $region"
     "###---------------------------------------------------------------------------#########"

    

      $workspace = "$RG"+"$region"
      
      "ADB=====================================================================ADB"
       
       Write-Output "$workspace deployment started in $region"
      
       
       
       #az group deployment create --name TestDeployment --resource-group $ResourceGroupName --template-uri $templateFilePath --parameters 'workspaceName=$workspace' --no-wait
       #New-AzResourceGroupDeployment -Name "TestDeployment" -ResourceGroupName $ResourceGroupName1 -TemplateFile $templateFilePath -TemplateParameterFile $parametersFilePath
       #New-AzResourceGroupDeployment -Name "TestDeployment" -ResourceGroupName $ResourceGroupName1 -TemplateFile $templateFilePath -TemplateParameterFile $parametersFilePath  -workspaceName $workspace
       New-AzResourceGroupDeployment -Name "TestDeployment" -ResourceGroupName $ResourceGroupName1 -TemplateFile $templateFilePath -AsJob
       Write-Output " $workspace deployment ended in $region"
        
        "ADB========================================================================ADB"

       #$status=Get-AzureRmResourceGroupDeployment -ResourceGroupName "$ResourceGroupName"
      



     }

    