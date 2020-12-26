// OM: "search4Dinfo".oBtnFilterIsNew

C_TEXT:C284($tag1; $tag2; $tag3)
C_COLLECTION:C1488($colDistinctIsNew)
C_TEXT:C284($vtItems)
C_LONGINT:C283($vlUserChoice)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		$colDistinctIsNew:=Form:C1466.colKb4dCom.distinct("isnew")
		$colDistinctIsNew.insert(0; "<Clear all filters>")
		$colDistinctIsNew.insert(1; "<emptyString>")
		$colDistinctIsNew.insert(2; "<null>")
		$vtItems:=$colDistinctIsNew.join(Char:C90(13); ck ignore null or empty:K85:5)
		$colDistinctIsNew:=Split string:C1554($vtItems; Char:C90(13); sk diacritical:K86:3+sk diacritical:K86:3)
		$vtItems:=$colDistinctIsNew.join(Char:C90(1); ck ignore null or empty:K85:5)
		
		$vtItems:=Char:C90(1)+$vtItems
		$vlUserChoice:=Pop up menu:C542($vtItems)
		
		Case of 
			: ($vlUserChoice<1)
				BEEP:C151
				
			: ($vlUserChoice>$colDistinctIsNew.length)
				BEEP:C151
				
			: ($colDistinctIsNew[$vlUserChoice-1]="<Clear all filters>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dComALL
				OBJECT SET TITLE:C194(*; "oBtnFilterIsNew"; "isnew")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterIsNew"; "Filter isnew")
				clearKb4dFilters
				
			: ($colDistinctIsNew[$vlUserChoice-1]="<emptyString>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("isnew = ''")
				OBJECT SET TITLE:C194(*; "oBtnFilterIsNew"; "#"+"<emptyString>")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterIsNew"; "isnew=\""+"<emptyString>"+"\"")
				
			: ($colDistinctIsNew[$vlUserChoice-1]="<null>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("isnew = null")
				OBJECT SET TITLE:C194(*; "oBtnFilterIsNew"; "#"+"<null>")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterIsNew"; "isnew=\""+"<null>"+"\"")
				
			Else 
				If ($colDistinctIsNew[$vlUserChoice-1]="true")
					Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("isnew = true")
				Else 
					Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("isnew = false")
				End if 
				OBJECT SET TITLE:C194(*; "oBtnFilterIsNew"; "#"+$colDistinctIsNew[$vlUserChoice-1])
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterIsNew"; "isnew=\""+$colDistinctIsNew[$vlUserChoice-1]+"\"")
				
		End case 
		
End case 

// - EOF -