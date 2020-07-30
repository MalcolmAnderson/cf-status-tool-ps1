param ($sourceFileName, $targetFileName, $serviceName)

Add-Content -Path $targetFileName $serviceName
$statusline = cat ($sourceFileName) | Select-String -pattern $serviceName
$statusline = "     " + $statusline
Add-Content -Path $targetFileName $statusline
Add-Content -Path $targetFileName ""

