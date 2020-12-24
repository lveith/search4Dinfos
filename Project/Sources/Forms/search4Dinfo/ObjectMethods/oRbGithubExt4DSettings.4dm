
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		setGithubTagOff
		
		Form:C1466.rbGithubTypCode:=1
		Form:C1466.rbGithubTypRepositories:=0
		Form:C1466.rbGithubTypUsers:=0
		Form:C1466.rbGithubTypIssues:=0
		
		WA OPEN URL:C1020(*; "oWaGithub"; getGithubSearchUrl)
		
End case 
