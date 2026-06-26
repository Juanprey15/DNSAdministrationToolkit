<#
    ===============================================================================
    Module Name : WPF.psm1
    Author      : Juan Pablo Rey
    Version     : 0.2.0-alpha
    Description : WPF Framework Services
    ===============================================================================
#>

#region Framework Initialization

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

Set-StrictMode -Version Latest

Import-Module "$PSScriptRoot\ResourceManager.psm1" -Force

#endregion

#region Private Functions

#endregion

#region Public Functions

<#
.SYNOPSIS
Loads a XAML file and returns the corresponding WPF object.

.DESCRIPTION
Loads the specified XAML file, creates the WPF object and
automatically attaches the application's ResourceDictionary.

.PARAMETER Path
Path to the XAML file.

.OUTPUTS
System.Windows.DependencyObject
#>

function Import-DATXaml {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (-not (Test-Path -Path $Path)) {
        throw "XAML file not found: '$Path'."
    }

    try {

        [xml]$Xaml = Get-Content -Path $Path -Raw

        $Reader = New-Object System.Xml.XmlNodeReader $Xaml

        $Object = [Windows.Markup.XamlReader]::Load($Reader)

        if ($Object.PSObject.Properties.Name -contains "Resources") {

            $Object.Resources = Get-DATApplicationResources

        }

        return $Object

    }
    catch {

        throw "Failed to load XAML '$Path'. $($_.Exception.Message)"

    }

}

<#
.SYNOPSIS
Displays a WPF Window.
#>

function Show-DATWindow {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [System.Windows.Window]$Window
    )

    $null = $Window.ShowDialog()

}

<#
.SYNOPSIS
Returns a named control from a Window or Page.
#>

function Get-DATControl {

    [CmdletBinding()]
    param(

        [Parameter(Mandatory)]
        $Window,

        [Parameter(Mandatory)]
        [string]$Name

    )

    $Control = $Window.FindName($Name)

    if ($null -eq $Control) {

        throw "Control '$Name' was not found."

    }

    return $Control

}

#endregion

Export-ModuleMember -Function *