param ($sourceFileName, $targetFileName, $configurationName)

#Add-Content -Path $targetFileName $configurationName
$statusline = cat ($sourceFileName) | Select-String -pattern $configurationName
#$safeToContinue = $TRUE
if([string]::IsNullOrEmpty($statusline)){
    $statusline = "******************** " + $configurationName + " not found ********************"
    #$safeToContinue = $FALSE
}
$statusline = "     " + $statusline
Add-Content -Path $targetFileName $statusline

#return $safeToContinue
