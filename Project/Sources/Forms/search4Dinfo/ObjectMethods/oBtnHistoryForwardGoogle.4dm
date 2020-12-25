// OM: "search4Dinfo".oBtnHistoryForwardGoogle

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (WA Forward URL available:C1027(*; "oWaGoogle"))
			WA OPEN FORWARD URL:C1022(*; "oWaGoogle")
		Else 
			BEEP:C151  // no history Forward url available
		End if 
		
End case 

// - EOF -