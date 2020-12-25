// OM: "search4Dinfo".oBtnGoogleVideo4dDE

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		WA OPEN URL:C1020(*; "oWaGoogle"; getGoogleSearchUrl("video"; "4D Deutschland"))
		
End case 

// - EOF -