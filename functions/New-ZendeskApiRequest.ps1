function New-ZendeskApiRequest {

	<#
	.SYNOPSIS
	Returns API response.

	.PARAMETER Method
	Provide API Method GET, PUT or POST

	.PARAMETER Request 
	See Zendesk VSA API Documentation

	.PARAMETER RequestBody 
	Only used with PUT and POST request

	#>
    
	Param(
        [Parameter(Mandatory=$True)]
        [ValidateSet('GET','PUT','POST')]
		[string]$Method,

        [Parameter(Mandatory=$True)]
		[string]$Request,

		[Parameter(Mandatory=$False)]
		[string]$RequestBody
	)

	# Check API Parameters
	if (!$apiToken) {
		Write-Host 'Zendesk API token missing, please run Set-ZendeskApiParameters first!' -ForegroundColor 'Red'
		exit 1
	}

	# Add API parameters
	$params = [ordered] @{
		Uri         	= $Request
		Method      	= $Method
		ContentType 	= 'application/json; charset=utf-8'
		Headers     	= @{'Authorization' = 'Basic {0}' -f $apiToken}
	}

	# Add body request
	If ($RequestBody) {$params.Add('Body',$RequestBody)}
	
	# Invoke Rest API request
	try { 
		$response = Invoke-RestMethod @params 
	}
	catch {
		Write-Host $_.Exception.Message -f Red
		if($_.ErrorDetail) {Write-Host $_.ErrorDetail.Message -f Red}
		Write-Host $_.ScriptStackTrace -f Red
		exit 1
	}
	return $response
}