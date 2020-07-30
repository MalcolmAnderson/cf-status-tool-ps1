param ($sourceFileName, $targetFileName, $serviceName)

Add-Content -Path $targetFileName $serviceName
$statusline = cat ($sourceFileName) | Select-String -pattern $serviceName
$safeToContinue = $TRUE
if([string]::IsNullOrEmpty($statusline)){
    $statusline = "******************** " + $serviceName + " is stopped or not found ********************"
    $safeToContinue = $FALSE
}
$statusline = "     " + $statusline
Add-Content -Path $targetFileName $statusline

return $safeToContinue
