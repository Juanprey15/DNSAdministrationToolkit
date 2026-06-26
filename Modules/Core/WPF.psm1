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

    if (-not (Test-Path $Path)) {

        throw "XAML file not found: $Path"

    }

    $Xaml = Get-Content $Path -Raw

    $Reader = New-Object System.Xml.XmlNodeReader ([xml]$Xaml)

    return [Windows.Markup.XamlReader]::Load($Reader)

}



function Show-DATWindow {

    param(

        [Parameter(Mandatory)]

        $Window

    )

    $null = $Window.ShowDialog()

}


Export-ModuleMember -Function *