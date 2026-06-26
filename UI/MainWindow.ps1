Import-Module (Join-Path (Split-Path $PSScriptRoot -Parent) "Modules\Core\PathService.psm1") -Force
Import-Module (Join-Path (Get-DATCoreModulePath) "WPF.psm1") -Force

Write-Host "MainWindow PSScriptRoot = $PSScriptRoot" -ForegroundColor Green

function New-DATMainWindow {

    Write-Host "MainWindow PSScriptRoot = $PSScriptRoot" -ForegroundColor Green

    $Window = Import-DATXaml (Get-DATMainWindow)

    $MainFrame = Get-DATControl -Window $Window -Name "MainFrame"

    $Home = Import-DATXaml (Get-DATHomePage)

    [void]$MainFrame.Navigate($Home)

    return $Window
}