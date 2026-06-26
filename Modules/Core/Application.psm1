<#
    ===========================================================================
    Module Name : Application.psm1
    Author      : Juan Pablo Rey
    Version     : 0.1.0
    Description : Core application lifecycle for DNS Administration Toolkit.
    ===========================================================================
#>


function Get-DATVersion {

    return "0.1.0"

}


function Initialize-DAT {

    Write-Host ""
    Write-Host "Initializing DNS Administration Toolkit..." -ForegroundColor Cyan

}


function Start-DAT {

    Write-Host ""
    Write-Host "Starting DAT..." -ForegroundColor Green

}


function Stop-DAT {

    Write-Host ""
    Write-Host "Stopping DAT..." -ForegroundColor Yellow

}

Export-ModuleMember -Function *