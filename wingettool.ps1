# Seraph - made by ""

function installscriptseccondpart {

    try {
    winget install --id $id -s msstore --accept-package-agreements --accept-source-agreements | out-null
   
    do {
    start-sleep -Seconds 1
    }

    until (
    $tempprocess = $null -ne (get-process -ErrorAction SilentlyContinue -Name "$appname") 
    )

    write-host ""
    write-host $grey ([char]0x2726)"" -NoNewline;
    write-host "$grey Success! App installed." -ForegroundColor Green
    }

    catch {
    write-host "$grey Install Fail."
    break
    }

    Invoke-Item "$appname" -ErrorAction SilentlyContinue

    write-host $grey ([char]0x2726)"" -NoNewline;
    write-host "$grey Waiting for closure..."

   $tempprocess = (get-process -Name "$appname").Id
   
   if ($true) {

   do {

   try {

   $tempprocess = (get-process -ErrorAction SilentlyContinue -Name "$appname") 

   if ($null -eq $tempprocess) {
   try {
   winget uninstall --id $id --silent 2>&1 | Out-Null
   write-host $grey ([char]0x2726)"" -NoNewline;
   write-host "$grey Successfully banished: " -ForegroundColor Green -NoNewline;
   write-host "$grey $appname $version"
   }

   catch {
   write-host $grey ([char]0x2726)"" -NoNewline;
   write-host "$grey Fail."
   }
   }
   }

   catch {
   write-host $grey ([char]0x2726)" " -NoNewline;
   write-host "$grey Fail."
   }
}

until ($null -eq $tempprocess)

}
}

# start -----------------------

function seraphinstall {

    param ( 
        [bool] $debug
    )

    $esc = [char]27
    $grey = [char]27 + "[38;2;105;105;105m"
    $yellow = [char]27 + "[38;2;255;255;180m"
    
    write-host $grey ([char]0x2726) -NoNewline; 
    write-host "$grey  SeraphConsole"  -NoNewline;
    write-host $grey ([char]0x2726) -NoNewline;
    write-host ""
    write-host $grey ([char]0x2015)([char]0x2015)([char]0x2015)([char]0x2015)([char]0x2015)([char]0x2015)([char]0x2015)([char]0x2015)([char]0x2015)([char]0x2015)
    write-host "$grey ? " -NoNewline;
    write-host "$yellow Provide app name:"
    write-host $grey ([char]0x2726)" " -NoNewline;

    $usersearch = read-host 
    $searchresult = winget search -s msstore "$usersearch" --verbose-logs

    if ($debug -eq $true) {
        start-process powershell -ArgumentList "-NoExit", "-Command `"`$receivedVar='$searchresult'; Write-Host `$receivedVar` | format-table"""
    }

    else {
    # pass
    }

    If ($searchresult -match [string]$usersearch) {
        $searchresult | ForEach-Object {
            # Extract the app name (stopping at the first dash or double space)
            if ($_ -match "^([^-\s]+)") {
                $appname = $matches[1].Trim()
            }
        }
        
        $searchresult | ForEach-Object {
            # Skip the header and separator lines
            if ($_ -match "^\s*(Name\s+Id\s+Version|[-]+)$") {
                return
            }
        
            # Extract the version (last word in the line)
            if ($_ -match "\s{2,}([^\s]+)$") {
                $version = $matches[1].Trim()
            }
        }

        if ($null -eq $version -or $version -match " ") {
            $version = "Unknown Version"

        }

        write-host ""
        write-host $grey ([char]0x2726)"" -NoNewline;
        write-host "$grey Success! App found" -ForegroundColor DarkGreen
    }

    else {
    write-host ""
    write-host $grey ([char]0x2726)" " -NoNewline;
    write-host "$grey App not found :(" -ForegroundColor Red
    break
    }
  
    $searchresult | ForEach-Object {
        if ($_ -match "\s([A-Za-z0-9]{10,})\s+\S+$") {
            $id = $matches[1]
            write-host $grey ([char]0x2726)"" -NoNewline;
            write-host "$grey ID: $id" -ForegroundColor Cyan
            write-host "$grey"
            return
        }
    }
    
    if (-not $id) {
    write-host $grey ([char]0x2726)"" -NoNewline;
    write-host "$grey Failed to fetch app ID :(" -ForegroundColor Red 
    write-host ""
    }
    
    write-host "$grey ? " -NoNewline;
    write-host "$yellow Confirm temp installation: (y/n)"
    write-host $grey ([char]0x2726)" Name:" -NoNewline;
    write-host $grey $($appname.trim())
    write-host $grey ([char]0x2726)" Version:" -NoNewline
    write-host "$grey $version"
    write-host $grey ([char]0x2726)" " -NoNewline;
    $installconfirm = read-host 
    write-host ""



    if ($installconfirm -eq "y") {
        if ($debug -eq $true) {
            $debugoutput = winget install --id $id  -s msstore --verbose-logs Tee-Object | out-file -FilePath $filepath
            Start-Process $filepath
            Start-Process $appname
    
            installscriptseccondpart
        }

        else{
        installscriptseccondpart
        }
}

else {
    write-host $grey ([char]0x2726)"" -NoNewline;
    write-host "$grey Cancelled." -ForegroundColor Gray
    break
}

}

seraphinstall # remove when finished 