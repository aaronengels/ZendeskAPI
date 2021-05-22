# ZendeskAPI
This module is designed to make it easier to use the DattoRMM API in your PowerShell scripts.

# Basics

You can install the module from the [PowerShell Gallery](https://www.powershellgallery.com/packages/ZendeskAPI/1.0) and use example below to get started.

```powershell
begin {
	# Load Modules
	Import-Module ZendeskAPI -Force
	Import-Module BurntToast -Force


	# Specify Kaseya API Parameters
	$params = @{
			Domain	=  'Enter your Zendesk domain'
			Email  	=  'Enter your Email Address'
			Key  	  =  'Enter your API Key'
	}

	# Set Module API Parameters
	Set-ZendeskApiParameters @params

	# Remove Local API Parameters 
	Remove-Variable params -Force

}

process {
	

	# Put your code here
	ForEach ($activity in Get-ZendeskTicketActivities)
	{
		if($activity.verb -eq 'tickets.assignment')
		{
			$Title = $activity.title
			$TicketUrl = 'https://domain.zendesk.com/agent/tickets/' + $activity.object.ticket.id
			$Button = New-BTButton -Content 'Open Ticket' -Arguments $TicketUrl
			New-BurntToastNotification -Text $Title -Button $Button
		}
	} 

}

end {
	
	# Remove API Parameters
	Remove-ZendeskApiParameters
}



# use query assignee:aengels@mspbuilder.com updated>5minutes

```

# Zendesk API

To find more information how to use the [Zendesk API and create your API key](https://developer.zendesk.com/rest_api/docs/support/getting_started).

# Release notes

## Version 1.1
- Added Set-ZendeskApiParameters
- Added Remove-ZendeskApiParameters
- Added New-ZendeskApiRequest
- Added Get-ZendeskTickets
- Added Get-ZendeskTicketActivies
