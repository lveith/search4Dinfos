// OM: "search4Dinfo".oBtnFilterFavorite

C_TEXT:C284($tag1; $tag2; $tag3)
C_COLLECTION:C1488($colDistinctFavorite)
C_TEXT:C284($vtItems)
C_LONGINT:C283($vlUserChoice)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		$colDistinctFavorite:=Form:C1466.colKb4dCom.distinct("favorite")
		$colDistinctFavorite.insert(0; "<Clear all filters>")
		$colDistinctFavorite.insert(1; "<emptyString>")
		$colDistinctFavorite.insert(2; "<null>")
		$vtItems:=$colDistinctFavorite.join(Char:C90(13); ck ignore null or empty:K85:5)
		$colDistinctFavorite:=Split string:C1554($vtItems; Char:C90(13); sk diacritical:K86:3+sk diacritical:K86:3)
		$vtItems:=$colDistinctFavorite.join(Char:C90(1); ck ignore null or empty:K85:5)
		
		$vtItems:=Char:C90(1)+$vtItems
		$vlUserChoice:=Pop up menu:C542($vtItems)
		
		Case of 
			: ($vlUserChoice<1)
				BEEP:C151
				
			: ($vlUserChoice>$colDistinctFavorite.length)
				BEEP:C151
				
			: ($colDistinctFavorite[$vlUserChoice-1]="<Clear all filters>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dComALL
				OBJECT SET TITLE:C194(*; "oBtnFilterFavorite"; "favorite")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterFavorite"; "Filter favorite")
				clearKb4dFilters
				
			: ($colDistinctFavorite[$vlUserChoice-1]="<emptyString>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("favorite = ''")
				OBJECT SET TITLE:C194(*; "oBtnFilterFavorite"; "#"+"<emptyString>")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterFavorite"; "favorite=\""+"<emptyString>"+"\"")
				
			: ($colDistinctFavorite[$vlUserChoice-1]="<null>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("favorite = null")
				OBJECT SET TITLE:C194(*; "oBtnFilterFavorite"; "#"+"<null>")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterFavorite"; "favorite=\""+"<null>"+"\"")
				
			Else 
				If ($colDistinctFavorite[$vlUserChoice-1]="true")
					Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("favorite = true")
				Else 
					Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("favorite = false")
				End if 
				OBJECT SET TITLE:C194(*; "oBtnFilterFavorite"; "#"+$colDistinctFavorite[$vlUserChoice-1])
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterFavorite"; "favorite=\""+$colDistinctFavorite[$vlUserChoice-1]+"\"")
				
		End case 
		
End case 

// - EOF -