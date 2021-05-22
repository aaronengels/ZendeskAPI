function Get-ZendeskTicketActivities {

	<#
	.SYNOPSIS
	Fetches all Zendesk ticket activities.

	#>

	# API request
	$result = @()
	$method = 'GET'
    $nextpage = '{0}/api/v2/activities.json?page[size]=100' -f $apiUrl
    $result = do {
	    $response = New-ZendeskApiRequest $method $nextpage
	    if ($response) {
		    $nextpage = $response.links.next
		    $response.activities
	    }
    }
    until ($null -eq $nextpage)

    # Return API result
    return $result
}