//%attributes = {}
// PN: "kb4dDocReceiveInForm"

C_COLLECTION:C1488($colKb4dDoc;$1)
C_LONGINT:C283($assetid)

If (Count parameters:C259>0)
	$colKb4dDoc:=$1
End if 

Case of 
	: ($colKb4dDoc=Null:C1517)
	: (Value type:C1509($colKb4dDoc)#Is collection:K8:32)
	: ($colKb4dDoc.length<1)
	: (Form:C1466.colKb4dCom=Null:C1517)
		Form:C1466.colKb4dCom:=$colKb4dDoc
	: (Value type:C1509(Form:C1466.colKb4dCom)#Is collection:K8:32)
		Form:C1466.colKb4dCom:=$colKb4dDoc
	: (Form:C1466.colKb4dCom.length<1)
		Form:C1466.colKb4dCom:=$colKb4dDoc
	Else 
		Form:C1466.colKb4dCom.combine($colKb4dDoc)
End case 

Case of 
	: (Form:C1466.colKb4dCom=Null:C1517)
	: (Value type:C1509(Form:C1466.colKb4dCom)#Is collection:K8:32)
	: (Form:C1466.colKb4dCom.length<1)
	Else 
		$assetid:=OB Get:C1224(Form:C1466.colKb4dCom[0];"assetid";Is longint:K8:6)
		If ($assetid#0)
			If ($assetid#Form:C1466.kbAssetid)
				Form:C1466.kbAssetid:=$assetid
				WA OPEN URL:C1020(*;"oWaKb4dCom";"https://kb.4d.com/assetid="+String:C10($assetid))
				GOTO OBJECT:C206(*;"oColKb4dCom")
				LISTBOX SELECT ROW:C912(*;"oColKb4dCom";1;lk replace selection:K53:1)
				OBJECT SET SCROLL POSITION:C906(*;"oColKb4dCom";1;1;*)
			End if 
		End if 
End case 

// - EOF -