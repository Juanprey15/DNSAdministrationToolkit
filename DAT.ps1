<#
    ============================================================================
    DNS Administration Toolkit
    Entry Point
    ============================================================================
#>

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path

Import-Module "$Root\Modules\Core\Application.psm1" -Force

Initialize-DAT

Start-DAT
