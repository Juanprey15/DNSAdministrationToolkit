<#
    ===========================================================================
    Module Name : WPF.psm1
    Author      : Juan Pablo Rey
    Version     : 0.1.0
    Description : WPF Helper Module
    ===========================================================================
#>


Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

function Import-DATXaml {

    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (!(Test-Path $Path)) {
        throw "XAML file not found: $Path"
    }

    $Xaml = Get-Content $Path -Raw

    $Reader = New-Object System.Xml.XmlNodeReader ([xml]$Xaml)

    [Windows.Markup.XamlReader]::Load($Reader)

}

function Show-DATWindow {

    param(
        [Parameter(Mandatory)]
        $Window
    )

    $null = $Window.ShowDialog()

}

function Get-DATControl {

    param(

        [Parameter(Mandatory)]
        $Window,

        [Parameter(Mandatory)]
        [string]$Name

    )

    $Control = $Window.FindName($Name)

    if (!$Control) {

        throw "Control '$Name' not found."

    }

    return $Control

}

Export-ModuleMember -Function *