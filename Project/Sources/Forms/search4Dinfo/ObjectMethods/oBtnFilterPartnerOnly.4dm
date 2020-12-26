// OM: "search4Dinfo".oBtnFilterPartnerOnly

C_TEXT:C284($tag1; $tag2; $tag3)
C_COLLECTION:C1488($colDistinctPartnerOnly)
C_TEXT:C284($vtItems)
C_LONGINT:C283($vlUserChoice)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		$colDistinctPartnerOnly:=Form:C1466.colKb4dCom.distinct("partnerOnly")
		$colDistinctPartnerOnly.insert(0; "<Clear all filters>")
		$colDistinctPartnerOnly.insert(1; "<emptyString>")
		$colDistinctPartnerOnly.insert(2; "<null>")
		$vtItems:=$colDistinctPartnerOnly.join(Char:C90(13); ck ignore null or empty:K85:5)
		$colDistinctPartnerOnly:=Split string:C1554($vtItems; Char:C90(13); sk diacritical:K86:3+sk diacritical:K86:3)
		$vtItems:=$colDistinctPartnerOnly.join(Char:C90(1); ck ignore null or empty:K85:5)
		
		$vtItems:=Char:C90(1)+$vtItems
		$vlUserChoice:=Pop up menu:C542($vtItems)
		
		Case of 
			: ($vlUserChoice<1)
				BEEP:C151
				
			: ($vlUserChoice>$colDistinctPartnerOnly.length)
				BEEP:C151
				
			: ($colDistinctPartnerOnly[$vlUserChoice-1]="<Clear all filters>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dComALL
				OBJECT SET TITLE:C194(*; "oBtnFilterPartnerOnly"; "partnerOnly")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterPartnerOnly"; "Filter partnerOnly")
				clearKb4dFilters
				
			: ($colDistinctPartnerOnly[$vlUserChoice-1]="<emptyString>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("partnerOnly = ''")
				OBJECT SET TITLE:C194(*; "oBtnFilterPartnerOnly"; "#"+"<emptyString>")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterPartnerOnly"; "partnerOnly=\""+"<emptyString>"+"\"")
				
			: ($colDistinctPartnerOnly[$vlUserChoice-1]="<null>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("partnerOnly = null")
				OBJECT SET TITLE:C194(*; "oBtnFilterPartnerOnly"; "#"+"<null>")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterPartnerOnly"; "partnerOnly=\""+"<null>"+"\"")
				
			Else 
				If ($colDistinctPartnerOnly[$vlUserChoice-1]="true")
					Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("partnerOnly = true")
				Else 
					Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("partnerOnly = false")
				End if 
				OBJECT SET TITLE:C194(*; "oBtnFilterPartnerOnly"; "#"+$colDistinctPartnerOnly[$vlUserChoice-1])
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterPartnerOnly"; "partnerOnly=\""+$colDistinctPartnerOnly[$vlUserChoice-1]+"\"")
				
		End case 
		
End case 

// - EOF -