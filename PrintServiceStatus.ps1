param ($sourceFileName, $serviceName)

Write-Host $serviceName -NoNewline
cat ($sourceFileName) | Select-String -pattern $serviceName
Write