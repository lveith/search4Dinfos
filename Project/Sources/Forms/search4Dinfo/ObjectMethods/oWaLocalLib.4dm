// OM: "search4Dinfo".oWaLocalLib

Case of 
	: (Form event code:C388=On End URL Loading:K2:47)
		IDLE:C311
		
	: (Form event code:C388=On Begin URL Loading:K2:45)
		IDLE:C311
		
	: (Form event code:C388=On Window Opening Denied:K2:51)  // A pop-up window has been blocked
		IDLE:C311
		
	: (Form event code:C388=On URL Resource Loading:K2:46)
		IDLE:C311
		
	: (Form event code:C388=On URL Loading Error:K2:48)
		IDLE:C311
		//If (WA Get current URL(*; "oWaLocalLib")#"https://livedoc.4d.com/@")
		If (False:C215)
			setWaContentToInfo("oWaLocalLib")
		End if 
		//End if 
		
	: (Form event code:C388=On URL Filtering:K2:49)
		IDLE:C311
		
	: (Form event code:C388=On Open External Link:K2:50)  // An external URL has been opened in the browser
		IDLE:C311
		
	Else 
		IDLE:C311
		
End case 

// - EOF -