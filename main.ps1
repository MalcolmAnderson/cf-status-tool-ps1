Write-Host "Begin EBSS Health Check Automation Tool" 
if($args){
    $fileIdentifier = $args[0]
} else {
  $fileIdentifier = Get-Date -Format "yyyyMMdd_HHmm"
}
# duplicated logic with fileName 
$sourceFileName = "cfAppsData_" + $fileIdentifier + ".txt"
$targetFileName = "App_Results_" + $fileIdentifier + ".txt"
$serviceSourceFile = "_ServiceNames.txt"

Write-Host "Writing start applications to data file: " $sourceFileName
$cmd = "cf apps | Select-String -Pattern started > $sourceFileName"
Invoke-Expression $cmd


# ForEach ($serviceName in (Get-Content -Path $serviceSourceFile)){
#     $cmd = "./PrintServiceStatus " `
#             + " -sourceFileName " + $sourceFileName `
#             + " -targetFileName " + $targetFileName `
#             + " -serviceName " + $serviceName
#     write-host $cmd
#     Invoke-Expression $cmd
#  }



# if target file exists, delete it.
if(Test-Path $targetFileName -PathType Leaf){
    Remove-Item -Path $targetFileName
}


ForEach ($serviceName in (Get-Content -Path $serviceSourceFile)){
     $cmd = "./PrintServiceStatus " `
             + " -sourceFileName " + $sourceFileName `
             + " -targetFileName " + $targetFileName `
             + " -serviceName " + $serviceName
    write-host $cmd
    $safeToContinue = Invoke-Expression $cmd
    Write-Host $safeToContinue

    if($safeToContinue){
        # "data_" + yyyyMMdd_HHmm + "_ServiceName_Configuration.txt"
        $serviceConfigurationData_FileName = "data_" + $fileIdentifier + "_" + $ServiceName + "_Configuration.txt"
        Write-Host "Writing service configuration data file: " $serviceConfigurationData_FileName
        $cmd = "cf env $serviceName > $serviceConfigurationData_FileName"
        Invoke-Expression $cmd

        $cmdStem = "./PrintConfigurationStatus " `
             + " -sourceFileName " + $serviceConfigurationData_FileName `
             + " -targetFileName " + $targetFileName `
             + " -configurationName " 
        $cmd = $cmdStem + "level"
        write-host $cmd
        Invoke-Expression $cmd

        $cmd = $cmdStem + "Auto-Scaling"
        write-host $cmd
        Invoke-Expression $cmd
        
        $cmd = $cmdStem + "ENABLE_OAUTH:"
        write-host $cmd
        Invoke-Expression $cmd

        $cmd = $cmdStem + "oauthServer.basicAuth.username"
        write-host $cmd
        Invoke-Expression $cmd

        $cmd = $cmdStem + "GIT_BRANCH:"
        write-host $cmd
        Invoke-Expression $cmd
        
        $cmd = $cmdStem + "CONFIG_PROFILE:"
        write-host $cmd
        Invoke-Expression $cmd
        
        $cmd = $cmdStem + "CONFIG_LABEL:"
        write-host $cmd
        Invoke-Expression $cmd

        # Add separater for next group
        Add-Content -Path $targetFileName ""
     } else { 
        Add-Content -Path $targetFileName ""
     }
}
