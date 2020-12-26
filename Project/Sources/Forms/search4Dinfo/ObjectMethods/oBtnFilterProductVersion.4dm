// OM: "search4Dinfo".oBtnFilterProductVersion

C_TEXT:C284($tag1; $tag2; $tag3)
C_COLLECTION:C1488($colDistinctProductVersion)
C_TEXT:C284($vtItems)
C_LONGINT:C283($vlUserChoice)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		$colDistinctProductVersion:=Form:C1466.colKb4dCom.distinct("productVersion")
		$colDistinctProductVersion.insert(0; "<Clear all filters>")
		$colDistinctProductVersion.insert(1; "<emptyString>")
		$colDistinctProductVersion.insert(2; "<null>")
		$vtItems:=$colDistinctProductVersion.join(Char:C90(13); ck ignore null or empty:K85:5)
		$colDistinctProductVersion:=Split string:C1554($vtItems; Char:C90(13); sk diacritical:K86:3+sk diacritical:K86:3)
		$vtItems:=$colDistinctProductVersion.join(Char:C90(1); ck ignore null or empty:K85:5)
		
		$vtItems:=Char:C90(1)+$vtItems
		$vlUserChoice:=Pop up menu:C542($vtItems)
		
		Case of 
			: ($vlUserChoice<1)
				BEEP:C151
				
			: ($vlUserChoice>$colDistinctProductVersion.length)
				BEEP:C151
				
			: ($colDistinctProductVersion[$vlUserChoice-1]="<Clear all filters>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dComALL
				OBJECT SET TITLE:C194(*; "oBtnFilterProductVersion"; "productVersion")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterProductVersion"; "Filter productVersion")
				clearKb4dFilters
				
			: ($colDistinctProductVersion[$vlUserChoice-1]="<emptyString>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("productVersion = ''")
				OBJECT SET TITLE:C194(*; "oBtnFilterProductVersion"; "#"+"<emptyString>")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterProductVersion"; "productVersion=\""+"<emptyString>"+"\"")
				
			: ($colDistinctProductVersion[$vlUserChoice-1]="<null>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("productVersion = null")
				OBJECT SET TITLE:C194(*; "oBtnFilterProductVersion"; "#"+"<null>")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterProductVersion"; "productVersion=\""+"<null>"+"\"")
				
			Else 
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("productVersion = :1"; $colDistinctProductVersion[$vlUserChoice-1])
				OBJECT SET TITLE:C194(*; "oBtnFilterProductVersion"; "#"+$colDistinctProductVersion[$vlUserChoice-1])
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterProductVersion"; "productVersion=\""+$colDistinctProductVersion[$vlUserChoice-1]+"\"")
				
		End case 
		
End case 

// - EOF -