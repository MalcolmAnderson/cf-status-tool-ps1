



# $fileIdentifier = Get-Date -Format "yyyyMMdd_HHmm"
$fileIdentifier = "20200730_1132"
$sourceFileName = "cfAppsData_" + $fileIdentifier + ".txt"
$targetFileName = "EBSS_Results_" + $fileIdentifier + ".txt"
$serviceSourceFile = "_ServiceNames_2.txt"

Remove-Item -Path $targetFileName


ForEach ($serviceName in (Get-Content -Path $serviceSourceFile)){
     $cmd = "./PrintServiceStatus " `
             + " -sourceFileName " + $sourceFileName `
             + " -targetFileName " + $targetFileName `
             + " -serviceName " + $serviceName
    write-host $cmd
     $safeToContinue = Invoke-Expression $cmd
     Write-Host $safeToContinue
}
