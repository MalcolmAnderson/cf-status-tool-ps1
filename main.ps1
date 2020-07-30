Write-Host "Begin EBSS Health Check Automation Tool" 
if($args){
    $fileIdentifier = $args[0]
} else {
  $fileIdentifier = Get-Date -Format "yyyyMMdd_HHmm"
}
# duplicated logic with fileName 
$sourceFileName = "cfAppsData_" + $fileIdentifier + ".txt"
$targetFileName = "App_Results_" + $fileIdentifier + ".txt"
$serviceSourceFile = "_ServiceNames_2.txt"

Write-Host "Writing start applications to data file: " $sourceFileName
$cmd = "cf apps | Select-String -Pattern started > $sourceFileName"
Invoke-Expression $cmd


ForEach ($serviceName in (Get-Content -Path $serviceSourceFile)){
    $cmd = "./PrintServiceStatus " `
            + " -sourceFileName " + $sourceFileName `
            + " -targetFileName " + $targetFileName `
            + " -serviceName " + $serviceName
    write-host $cmd
    Invoke-Expression $cmd
 }
