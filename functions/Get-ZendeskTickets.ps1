function Get-ZendeskTickets {

	<#
	.SYNOPSIS
	Fetches all Zendesk tickets.

	#>

	# API request
	$result = @()
	$method = 'GET'
    $nextpage = '{0}/api/v2/tickets.json?page[size]=100' -f $apiUrl
    $result = do {
	    $response = New-ZendeskApiRequest $method $nextpage
	    if ($response) {
		    $nextpage = $response.links.next
		    $response.tickets
	    }
    }
    until ($null -eq $nextpage)

    # Return API result
    return $result
}