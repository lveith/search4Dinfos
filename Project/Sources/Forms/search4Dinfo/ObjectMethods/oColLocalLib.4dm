// OM: "search4Dinfo".oColLocalLib

C_TEXT:C284($id)

Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		WA OPEN URL:C1020(*; "oWaLocalLib"; "about:blank")
		Case of 
			: (Form:C1466.localLibCurrEl=Null:C1517)
			: (Value type:C1509(Form:C1466.localLibCurrEl)#Is object:K8:27)
			: (Form:C1466.localLibCurrEl.key=Null:C1517)
			Else 
				$id:=OB Get:C1224(Form:C1466.localLibCurrEl; "key"; Is text:K8:3)
				If ($id#"")
					If ($id#Form:C1466.localLibLastCurrId)
						Form:C1466.localLibLastCurrId:=$id
						
						Case of 
							: (Form:C1466.localLibCurrEl.url=Null:C1517)
							: (Value type:C1509(Form:C1466.localLibCurrEl.url)#Is text:K8:3)
							: (Form:C1466.localLibCurrEl.url="")
							Else 
								If (Form:C1466.localLibCurrEl.url[[1]]="*")
									WA OPEN URL:C1020(*; "oWaLocalLib"; "file:///"+Convert path system to POSIX:C1106(Get 4D folder:C485(Current resources folder:K5:16))+"/html/"+Substring:C12(Form:C1466.localLibCurrEl.url; 2))
								Else 
									WA OPEN URL:C1020(*; "oWaLocalLib"; Form:C1466.localLibCurrEl.url)
								End if 
						End case 
						
					End if 
				End if 
		End case 
		
End case 

// - EOF -