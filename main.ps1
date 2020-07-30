Write-Host "Begin EBSS Health Check Automation Tool" 
if($args){
    $fileIdentifier = $args[0]
} else {
  $fileIdentifier = Get-Date -Format "yyyyMMdd_HHmm"
}
# duplicated logic with fileName 
$sourceFileName = "cfAppsData_" + $fileIdentifier + ".txt"
$targetFileName = "EBSS_Results_" + $fileIdentifier + ".txt"
$serviceSourceFile = "_ServiceNames_2.txt"
Write-Host "Calling GetAppsData.ps1 to create data file: " $sourceFileName
Invoke-Expression "./GetAppsData.ps1 $fileIdentifier"



 ForEach ($serviceName in (Get-Content -Path $serviceSourceFile)){
     $cmd = "./PrintServiceStatus " `
             + " -sourceFileName " + $sourceFileName `
             + " -targetFileName " + $targetFileName `
             + " -serviceName " + $serviceName
    write-host $cmd
     Invoke-Expression $cmd
 }
