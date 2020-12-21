// OM: "search4Dinfo".oColKb4dCom

C_LONGINT:C283($assetid)

Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		Case of 
			: (Form:C1466.kb4dComCurrEl=Null:C1517)
			: (Value type:C1509(Form:C1466.kb4dComCurrEl)#Is object:K8:27)
			: (Form:C1466.kb4dComCurrEl.assetid=Null:C1517)
			Else 
				$assetid:=OB Get:C1224(Form:C1466.kb4dComCurrEl;"assetid";Is longint:K8:6)
				If ($assetid#0)
					If ($assetid#Form:C1466.kbAssetid)
						Form:C1466.kbAssetid:=$assetid
						WA OPEN URL:C1020(*;"oWaKb4dCom";"https://kb.4d.com/assetid="+String:C10($assetid))
					End if 
				End if 
		End case 
		
End case 

// - EOF -
