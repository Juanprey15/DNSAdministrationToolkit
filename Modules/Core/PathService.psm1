<#
===============================================================================
Module Name : PathService.psm1
Author      : Juan Pablo Rey
Version     : 0.1.0
Description : Centralized path management.
===============================================================================
#>

$script:ProjectRoot = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent

function Get-DATProjectRoot {
    return $script:ProjectRoot
}

function Get-DATConfigPath {
    Join-Path $script:ProjectRoot "Config"
}

function Get-DATSettingsFile {
    Join-Path (Get-DATConfigPath) "Settings.json"
}

function Get-DATModulePath {
    Join-Path $script:ProjectRoot "Modules"
}

function Get-DATCoreModulePath {
    Join-Path (Get-DATModulePath) "Core"
}

function Get-DATUIPath {
    Join-Path $script:ProjectRoot "UI"
}

function Get-DATMainWindow {
    Join-Path (Get-DATUIPath) "MainWindow.xaml"
}

function Get-DATMainWindowScript {
    Join-Path (Get-DATUIPath) "MainWindow.ps1"
}

function Get-DATHomePage {
    Join-Path (Get-DATUIPath) "Pages\Home.xaml"
}

function Get-DATAssetsPath {
    Join-Path $script:ProjectRoot "Assets"
}

function Get-DATThemesPath {
    Join-Path (Get-DATAssetsPath) "Themes"
}

function Get-DATStylesPath {
    Join-Path (Get-DATAssetsPath) "Styles"
}

function Get-DATLogsPath {
    Join-Path $script:ProjectRoot "Logs"
}

function Get-DATOutputPath {
    Join-Path $script:ProjectRoot "Output"
}

Export-ModuleMember -Function *