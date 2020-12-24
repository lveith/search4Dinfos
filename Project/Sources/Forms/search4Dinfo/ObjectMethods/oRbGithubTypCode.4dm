
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		
		If ((isGithubLangActive) & (Not:C34(isGithubTagActive)) & (Form:C1466.searchValueGithub=""))
			setGithubTagOff
			setGithubLangOff
		End if 
		
		WA OPEN URL:C1020(*; "oWaGithub"; getGithubSearchUrl)
		
End case 
