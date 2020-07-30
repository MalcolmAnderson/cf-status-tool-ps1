

ForEach ($serviceName in (Get-Content -Path ServiceNames_2.txt)){
    $cmd = "./PrintServiceStatus " `
            + "-sourceFileName cfAppsData_20200729_1507.txt " `
            + "-targetFileName out.txt " `
            + "-serviceName " + $serviceName
    Invoke-Expression $cmd
}
