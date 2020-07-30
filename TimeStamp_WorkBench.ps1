Write-Host Get-Date
Write-Host (Get-Culture).DateTimeFormat
Write-Host Get-Date -Format "yyyyMMdd_HHmm"

Get-Date
(Get-Culture).DateTimeFormat
Get-Date -Format "yyyyMMdd_HHmm"
