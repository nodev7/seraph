# seraph - a temp app intaller. 

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

function installscriptsecondpart {  # function not for user
    try {
        Write-Host $grey ([char]0x2726) "" -NoNewline
        Write-Host "$grey Installing..." -ForegroundColor Green -NoNewline
        winget install --id $id --accept-package-agreements --accept-source-agreements 2>&1 | Out-Null

        do {
            Start-Sleep -Seconds 1
            $tempprocess = Get-Process -ErrorAction SilentlyContinue -Name $appname
        } until ($tempprocess)

        Write-Host ""
        Write-Host $grey ([char]0x2726) "" -NoNewline
        Write-Host "$grey Success! App installed." -ForegroundColor Green
    }
    catch {
        Write-Host $grey ([char]0x2726) "" -NoNewline
        Write-Host "$grey Install Fail: $_" -ForegroundColor Red
    }

    # Launch app (best effort)

    Invoke-Item "$appname" -ErrorAction SilentlyContinue

    Write-Host $grey ([char]0x2726) "" -NoNewline
    Write-Host "$grey Waiting for closure..."

    # Wait for app to close
    do {
        Start-Sleep -Seconds 1
        $tempprocess = Get-Process -ErrorAction SilentlyContinue -Name $appname
    } until (-not $tempprocess)

    # Uninstall silently after close

    try {
        winget uninstall --id $id --silent 2>&1 | Out-Null
        Write-Host $grey ([char]0x2726) "" -NoNewline
        Write-Host "$grey Successfully banished: " -ForegroundColor Green -NoNewline
        Write-Host "$grey $appname $version"
    }
    catch {
        Write-Host $grey ([char]0x2726) "" -NoNewline
        Write-Host "$grey Fail uninstalling."
    }
}

function seraphinstall {
    param ( [bool] $debug = $false )

    $esc = [char]27
    $grey = "$esc[38;2;105;105;105m"
    $yellow = "$esc[38;2;255;255;180m"
    write-host ""
    write-host $grey ([char]0x2726) -NoNewline
    write-host "$grey  SeraphConsole" -NoNewline
    write-host $grey ([char]0x2726) -NoNewline
    write-host ""
    write-host $grey ([char]0x2015) ([char]0x2015) ([char]0x2015) ([char]0x2015) ([char]0x2015) ([char]0x2015) ([char]0x2015) ([char]0x2015) ([char]0x2015) ([char]0x2015)

    write-host "$grey ? " -NoNewline
    write-host "$yellow Provide app name:"
    write-host $grey ">  " -NoNewline

    $usersearch = read-host

    # Run winget search and capture output lines (skip first 2 header lines)

    $searchOutput = winget search --source winget --name $usersearch 2>$null
    if (-not $searchOutput) {
        write-host ""
        write-host $grey "!" -NoNewline;
        write-host "$grey App not found or winget error." -ForegroundColor Red
        return
    }

    # Skip header lines (usually first two)

    $appLines = $searchOutput | Select-Object -Skip 2

    # Parse the first matching app line

    $appParsed = $null
    foreach ($line in $appLines) {

        # Match line format: Name (spaces) Id (spaces) Version

        if ($line -match '^(.{1,25})\s+([^\s]{1,40})\s+([\d\.]+)$') {
            $appParsed = @{
                Name = $matches[1].Trim()
                Id = $matches[2].Trim()
                Version = $matches[3].Trim()
            }
            break
        }
    }

    if (-not $appParsed) {
        write-host ""
        write-host $grey "!" -NoNewline;
        write-host "$grey Could not parse search results." -ForegroundColor Red
        return
    }

    $appname = $appParsed.Name
    $id = $appParsed.Id
    $version = $appParsed.Version

    write-host ""
    write-host $grey ([char]0x2726) "" -NoNewline
    write-host "$grey Success! App found" -ForegroundColor DarkGreen
    write-host $grey ([char]0x2726) "" -NoNewline
    write-host "$grey ID: $id" -ForegroundColor Cyan
    write-host ""

    write-host "$grey ? " -NoNewline
    write-host "$yellow Confirm temp installation: (y/n)"
    write-host $grey ([char]0x2726) " Name:" -NoNewline
    write-host "$grey $appname"
    write-host $grey ([char]0x2726) " Version:" -NoNewline
    write-host "$grey $version"
    write-host $grey ">  " -NoNewline

    $installconfirm = read-host
    write-host ""

    if ($installconfirm -eq 'y') {
        if ($debug -eq $true) {
            $logfile = "$env:TEMP\seraph_debug_log.txt"
            winget install --id $id --accept-package-agreements --accept-source-agreements --verbose-logs | Tee-Object -FilePath $logfile
            Start-Process $logfile
            Start-Process $appname
            installscriptsecondpart
        }
        else {
            installscriptsecondpart
        }
    }
    else {
        write-host $grey "!" -NoNewline
        write-host "$grey Cancelled." -ForegroundColor Gray
    }
}

Export-ModuleMember -Function seraphinstall
Export-ModuleMember -Function installscriptsecondpart
