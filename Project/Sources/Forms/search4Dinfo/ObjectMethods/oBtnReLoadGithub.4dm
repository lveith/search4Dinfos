// OM: "search4Dinfo".oBtnReLoadGithub

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		WA OPEN URL:C1020(*; "oWaGithub"; Form:C1466.currUrlGithub)
		
End case 

// - EOF -