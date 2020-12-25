// OM: "search4Dinfo".oBtnHistoryForwardGithub

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (WA Forward URL available:C1027(*; "oWaGithub"))
			WA OPEN FORWARD URL:C1022(*; "oWaGithub")
		Else 
			BEEP:C151  // no history Forward url available
		End if 
		
End case 

// - EOF -