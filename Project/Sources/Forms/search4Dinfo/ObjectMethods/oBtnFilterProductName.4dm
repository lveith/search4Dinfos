// OM: "search4Dinfo".oBtnFilterProductName

C_TEXT:C284($tag1; $tag2; $tag3)
C_COLLECTION:C1488($colDistinctProductName)
C_TEXT:C284($vtItems)
C_LONGINT:C283($vlUserChoice)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		$colDistinctProductName:=Form:C1466.colKb4dCom.distinct("productName")
		$colDistinctProductName.insert(0; "<Filter OFF>")
		$colDistinctProductName.insert(1; "<emptyString>")
		$colDistinctProductName.insert(2; "<null>")
		$vtItems:=$colDistinctProductName.join(Char:C90(13); ck ignore null or empty:K85:5)
		$colDistinctProductName:=Split string:C1554($vtItems; Char:C90(13); sk diacritical:K86:3+sk diacritical:K86:3)
		$vtItems:=$colDistinctProductName.join(Char:C90(1); ck ignore null or empty:K85:5)
		
		$vtItems:=Char:C90(1)+$vtItems
		$vlUserChoice:=Pop up menu:C542($vtItems)
		
		Case of 
			: ($vlUserChoice<1)
				BEEP:C151
				
			: ($vlUserChoice>$colDistinctProductName.length)
				BEEP:C151
				
			: ($colDistinctProductName[$vlUserChoice-1]="<Filter OFF>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dComALL
				OBJECT SET TITLE:C194(*; "oBtnFilterProductName"; "productName")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterProductName"; "Filter productName")
				
			: ($colDistinctProductName[$vlUserChoice-1]="<emptyString>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("productName = ''")
				OBJECT SET TITLE:C194(*; "oBtnFilterProductName"; "#"+"<emptyString>")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterProductName"; "productName=\""+"<emptyString>"+"\"")
				
			: ($colDistinctProductName[$vlUserChoice-1]="<null>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("productName = null")
				OBJECT SET TITLE:C194(*; "oBtnFilterProductName"; "#"+"<null>")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterProductName"; "productName=\""+"<null>"+"\"")
				
			Else 
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("productName = :1"; $colDistinctProductName[$vlUserChoice-1])
				OBJECT SET TITLE:C194(*; "oBtnFilterProductName"; "#"+$colDistinctProductName[$vlUserChoice-1])
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterProductName"; "productName=\""+$colDistinctProductName[$vlUserChoice-1]+"\"")
				
		End case 
		
End case 

// - EOF -