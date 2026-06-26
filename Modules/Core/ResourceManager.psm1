<#
    ===============================================================================
    Module Name : ResourceManager.psm1
    Author      : Juan Pablo Rey
    Version     : 0.2.0-alpha
    Description : Loads and manages application Resource Dictionaries.
    ===============================================================================
#>

<#
    Dependencies

    PresentationFramework
    PresentationCore
    WindowsBase
#>

#region Framework Initialization

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

Set-StrictMode -Version Latest

#endregion

#region Module Configuration

$script:ProjectRoot = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent

$script:ResourceFiles = @(
    "Assets\Themes\Dark.xaml"
)

#endregion

#region Private Functions

function Import-DATResourceDictionary {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (-not (Test-Path -Path $Path)) {
        throw "Resource dictionary not found: '$Path'."
    }

    try {

        [xml]$Xaml = Get-Content -Path $Path -Raw

        $Reader = New-Object System.Xml.XmlNodeReader $Xaml

        return [Windows.Markup.XamlReader]::Load($Reader)

    }
    catch {

        throw "Failed to load resource dictionary '$Path'. $($_.Exception.Message)"

    }

}

#endregion

#region Public Functions

<#
.SYNOPSIS
Returns the application's merged ResourceDictionary.

.DESCRIPTION
Loads all configured application resource dictionaries and merges
them into a single ResourceDictionary that can be assigned to a
WPF Window or Page.

.OUTPUTS
System.Windows.ResourceDictionary

.EXAMPLE
$Resources = Get-DATApplicationResources

Returns the application's merged ResourceDictionary.
#>

function Get-DATApplicationResources {

    [CmdletBinding()]
    param()

    $Resources = New-Object System.Windows.ResourceDictionary

    foreach ($ResourceFile in $script:ResourceFiles) {

        $Dictionary = Import-DATResourceDictionary `
            -Path (Join-Path $script:ProjectRoot $ResourceFile)

        [void]$Resources.MergedDictionaries.Add($Dictionary)

    }

    return $Resources

}

#endregion

Export-ModuleMember -Function Get-DATApplicationResources