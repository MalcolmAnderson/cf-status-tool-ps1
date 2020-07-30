Write-Host "Begin EBSS Health Check Automation Tool" 
if($args){
    $fileIdentifier = $args[0]
} else {
  $fileIdentifier = Get-Date -Format "yyyyMMdd_HHmm"
}
# duplicated logic with fileName 
$sourceFileName = "cfAppsData_" + $fileIdentifier + ".data"
$outFileName = "EBSS_Results_" + $fileIdentifier + ".data"
Write-Host "Calling GetAppsData.ps1 to create data file: " $sourceFileName
Invoke-Expression "./GetAppsData.ps1 $fileIdentifier"

#Write-Host "outFileName = " $outFileName

 ForEach ($serviceName in (Get-Content -Path ServiceNames.txt)){
     $cmd = "./PrintServiceStatus " `
             + " -sourceFileName " + $sourceFileName `
             + " -targetFileName " + $outFileName `
             + " -serviceName " + $serviceName
    write-host $cmd
     Invoke-Expression $cmd
 }
