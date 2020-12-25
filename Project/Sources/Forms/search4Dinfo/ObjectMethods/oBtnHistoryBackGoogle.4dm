// OM: "search4Dinfo".oBtnHistoryBackGoogle

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (WA Back URL available:C1026(*; "oWaGoogle"))
			WA OPEN BACK URL:C1021(*; "oWaGoogle")
		Else 
			BEEP:C151  // no history back url available
		End if 
		
End case 

// - EOF -