<#
    ===========================================================================
    DNS Administration Toolkit (DAT)
    Build Script
    ---------------------------------------------------------------------------
    Author      : Juan Pablo Rey
    Version     : 0.1.0
    Description : Bootstraps the DAT development environment.
    ===========================================================================

    This script is safe to execute multiple times.
    Existing files are never overwritten.
#>

Clear-Host

$ErrorActionPreference = 'Stop'

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host " DNS Administration Toolkit" -ForegroundColor Cyan
Write-Host " Bootstrap Builder v0.1" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

#----------------------------------------------------------
# Validate PowerShell
#----------------------------------------------------------

if ($PSVersionTable.PSVersion.Major -lt 5) {

    throw "PowerShell 5.1 or later is required."
}

#----------------------------------------------------------
# Validate DNS Module
#----------------------------------------------------------

$DnsModule = Get-Module -ListAvailable DnsServer

if ($DnsModule) {

    Write-Host "[OK] DnsServer module detected." -ForegroundColor Green

}
else {

    Write-Warning "DnsServer module not found."

}

#----------------------------------------------------------
# Folders
#----------------------------------------------------------

$Folders = @(

    "Assets",

    "Assets\Icons",

    "Assets\Images",

    "Assets\Themes",

    "Config",
    
    "Docs",

    "Logs",

    "Models",

    "Modules",

    "Modules\Core",

    "Modules\Services",

    "Modules\Providers",

    "Output",

    "Tests",

    "Temp",

    "Tools",

    "UI",

    "UI\Pages"

)

foreach ($Folder in $Folders) {

    $Path = Join-Path $Root $Folder

    if (-not (Test-Path $Path)) {

        New-Item `
            -ItemType Directory `
            -Path $Path | Out-Null

        Write-Host "[+] Created $Folder"

    }
    else {

        Write-Host "[=] Exists  $Folder"

    }

}

#----------------------------------------------------------
# Files
#----------------------------------------------------------

$Files = @{

    "DAT.ps1" = ""

    "Config\Settings.json" = @'
{
    "ApplicationName": "DNS Administration Toolkit",
    "Version": "0.1.0",
    "Theme": "Dark",
    "WindowWidth":1400,
    "WindowHeight":900,
    "DefaultDnsServer": "",
    "ExportFolder": ".\\Output",
    "LogFolder": ".\\Logs",
    "RecentSearches": 20,
    "AutoSaveLogs": true
}
'@

    "Modules\Core\Logger.psm1" = ""

    "Modules\Core\Settings.psm1" = ""

    "Modules\Core\Utilities.psm1" = ""

    "Modules\Services\SearchService.psm1" = ""

    "Modules\Services\ExportService.psm1" = ""

    "Modules\Providers\MicrosoftDns.psm1" = ""

    "Models\DNSRecord.ps1" = ""

    "UI\MainWindow.xaml" = ""

    "UI\MainWindow.ps1" = ""

    "CHANGELOG.md" = "# Changelog"

}

foreach ($File in $Files.Keys) {

    $Path = Join-Path $Root $File

    if (-not (Test-Path $Path)) {

        $Files[$File] | Set-Content $Path

        Write-Host "[+] Created $File"

    }
    else {

        Write-Host "[=] Exists  $File"

    }

}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host " Bootstrap completed successfully." -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green