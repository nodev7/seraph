@{
    ModuleVersion = '1.0.0'
    GUID = '6bdded45-6ff0-4a67-94cd-98f616d75845'
    Author = 'nodev'
    Description = 'Temporary installs with Windows Package Manager (winget)'
    RootModule = 'seraph.psm1'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('seraphinstall')

    # Put extra metadata here:
    PrivateData = @{
        Tags = @('cli', 'powershell-module', 'winget')
        ProjectUri = 'https://github.com/nodev7/seraph'
        LicenseUri = 'https://raw.githubusercontent.com/nodev7/seraph/main/LICENSE'
        ReleaseNotes = 'Initial release.'
    }
}
