function Set-ZendeskApiParameters {
	<#
	.SYNOPSIS
	Sets the Zendesk API variables used throughout the module.

	.PARAMETER Domain
	Provide Zendesk Domain.

	.PARAMETER Email
	Provide Zendesk Login.

	.PARAMETER Key
	Provide Zendesk API Key.
	
	#>
	
	Param(
		[Parameter(Mandatory=$True)]
		$Domain,
		
		[Parameter(Mandatory=$True)]
		$Email,

		[Parameter(Mandatory=$True)]
		$Key
	
	)


	$Url = 'https://' + $Domain + '.zendesk.com'
	New-Variable -Name apiUrl -Value $Url -Scope Script -Force
	
	$Token = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$($Email)/token:$($Key)"))
	New-Variable -Name apiToken -value $Token -Scope Script -Force
	
}
