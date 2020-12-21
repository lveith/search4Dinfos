// OM: "search4Dinfo".oWaKb4dCom

Case of 
	: (Form event code:C388=On End URL Loading:K2:47)
		If (Shift down:C543)
			TRACE:C157
		End if 
		
		Case of 
			: (Form event code:C388=On Begin URL Loading:K2:45)
				
			: (Form event code:C388=On Window Opening Denied:K2:51)  // A pop-up window has been blocked
				
			: (Form event code:C388=On URL Resource Loading:K2:46)
				
			: (Form event code:C388=On URL Loading Error:K2:48)
				
			: (Form event code:C388=On URL Filtering:K2:49)
				
			: (Form event code:C388=On Open External Link:K2:50)  // An external URL has been opened in the browser
				
			Else 
				IDLE:C311
				If (False:C215)
					TRACE:C157
				End if 
				
		End case 
		
End case 

// - EOF -