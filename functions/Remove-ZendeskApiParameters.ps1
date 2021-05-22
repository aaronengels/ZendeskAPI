function Remove-ZendeskApiParameters {

    <#
    
	.SYNOPSIS
    Removes the Zendesk API variables used throughout the module.
    
	#>
	
    Remove-Variable -Name apiUrl -Scope Script -Force
    Remove-Variable -Name apiToken -Scope Script  -Force
}