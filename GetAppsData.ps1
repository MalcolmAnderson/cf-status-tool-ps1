if($args){
    #Write-Host "args are not empty"
    #Write-Host $args
    $fileIdentifier = $args[0]
} else {
    #Write-Host "args are empty"
    $fileIdentifier = Get-Date -Format "yyyyMMdd_HHmm"
}
$fileName = "cfAppsData_" + $fileIdentifier + ".txt"
Write-Host "Writing raw apps data to " $fileName
cf apps | Select-String -Pattern started > ($filename)