<#
    ============================================================================
    DNS Administration Toolkit
    Entry Point
    ============================================================================
#>

$ProjectRoot = Split-Path -Parent $PSCommandPath

Import-Module (Join-Path $ProjectRoot "Modules\Core\PathService.psm1") -Force
Import-Module (Join-Path $ProjectRoot "Modules\Core\Application.psm1") -Force

Initialize-DAT
Start-DAT
