<#
 
	.SYNOPSIS
	A PowerShell module that connects to the Datto RMM API.

	.DESCRIPTION
	A PowerShell module that connects to the Datto RMM API.
	
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
