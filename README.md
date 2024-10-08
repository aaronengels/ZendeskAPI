# ZendeskAPI
This module is designed to make it easier to use the Zendesk API in your PowerShell scripts.

# Basics

You can install this module from the [PowerShell Gallery](https://www.powershellgallery.com/packages/ZendeskAPI/1.0) and use example below to get started. This script will create Windows 10 toast notifications for any Zendesk tickets assigned to you the past 30 days.

```powershell
begin {

  # Load Modules
  Import-Module ZendeskAPI -Force
  Import-Module BurntToast -Force

  # Specify Kaseya API Parameters
  $params = @{
    Domain  =  'Enter your Zendesk domain'
    Email   =  'Enter your Email Address'
    Key     =  'Enter your API Key'
  }

  # Set Module API Parameters
  Set-ZendeskApiParameters @params

  # Remove Local API Parameters 
  Remove-Variable params -Force

}

process {

  # Put your code here
  ForEach ($activity in Get-ZendeskTicketActivities | Where-Object {$_.verb -eq 'tickets.assignment'})
  {
    $Title = $activity.title
    $TicketUrl = "https://$Domain.zendesk.com/agent/tickets/" + $activity.target.ticket.id
    $Button = New-BTButton -Content 'Open Ticket' -Arguments $TicketUrl
    New-BurntToastNotification -Text $Title -Button $Button
  } 
}

end {

  # Remove API Parameters
  Remove-ZendeskApiParameters
}

```

# Zendesk API

You'll find more information how to use the Zendesk API and create your API key at https://developer.zendesk.com/documentation/api-basics/

# Release notes

## Version 1.1
- Added Set-ZendeskApiParameters
- Added Remove-ZendeskApiParameters
- Added New-ZendeskApiRequest
- Added Get-ZendeskTickets
- Added Get-ZendeskTicketActivies
