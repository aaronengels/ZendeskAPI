<#
 
	.SYNOPSIS
	A PowerShell module that connects to the Zendesk API API.

#>

# Import functions
$Functions = @(Get-ChildItem -Path $PSScriptRoot\functions\*.ps1 -ErrorAction SilentlyContinue) 
foreach ($Import in @($Functions)){
  try {
    . $Import.fullname
  }
  catch {
    throw "Could not import function $($Import.fullname): $_"
  }
}