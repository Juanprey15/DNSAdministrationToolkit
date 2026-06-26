<#
    ===========================================================================
    Module Name : Application.psm1
    Author      : Juan Pablo Rey
    Version     : 0.1.0
    Description : Core application lifecycle for DNS Administration Toolkit.
    ===========================================================================
#>

Import-Module "$PSScriptRoot\PathService.psm1" -Force
Import-Module "$PSScriptRoot\WPF.psm1" -Force

Write-Host "Application PSScriptRoot = $PSScriptRoot" -ForegroundColor Yellow

function Get-DATVersion {

    "0.2.0-alpha"

}

function Initialize-DAT {

    Write-Host ""
    Write-Host "Initializing DNS Administration Toolkit..." -ForegroundColor Cyan

}

function Start-DAT {

    . (Get-DATMainWindowScript)

    $Window = New-DATMainWindow

    Write-Host $Window.GetType().FullName -ForegroundColor Yellow

    Show-DATWindow -Window $Window

}

Export-ModuleMember `
    -Function Get-DATVersion,
              Initialize-DAT,
              Start-DAT