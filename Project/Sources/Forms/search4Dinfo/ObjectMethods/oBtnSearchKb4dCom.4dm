
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		Form:C1466.colKb4dCom:=New collection:C1472
		Form:C1466.kbAssetid:=0
		clearKb4dFilters
		
		WA OPEN URL:C1020(*; "oWaKb4dCom"; "about:blank")
		CALL WORKER:C1389("kb4dDocWorker"; "kb4dDocWorker"; Current form window:C827; Form:C1466.searchValueKb4dCom)
		
End case 
