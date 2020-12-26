// OM: "search4Dinfo".oBtnFilterAssettype

C_TEXT:C284($tag1; $tag2; $tag3)
C_COLLECTION:C1488($colDistinctAssettype)
C_TEXT:C284($vtItems)
C_LONGINT:C283($vlUserChoice)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		$colDistinctAssettype:=Form:C1466.colKb4dCom.distinct("assettype")
		$colDistinctAssettype.insert(0; "<Filter OFF>")
		$colDistinctAssettype.insert(1; "<emptyString>")
		$colDistinctAssettype.insert(2; "<null>")
		$vtItems:=$colDistinctAssettype.join(Char:C90(13); ck ignore null or empty:K85:5)
		$colDistinctAssettype:=Split string:C1554($vtItems; Char:C90(13); sk diacritical:K86:3+sk diacritical:K86:3)
		$vtItems:=$colDistinctAssettype.join(Char:C90(1); ck ignore null or empty:K85:5)
		
		$vtItems:=Char:C90(1)+$vtItems
		$vlUserChoice:=Pop up menu:C542($vtItems)
		
		Case of 
			: ($vlUserChoice<1)
				BEEP:C151
				
			: ($vlUserChoice>$colDistinctAssettype.length)
				BEEP:C151
				
			: ($colDistinctAssettype[$vlUserChoice-1]="<emptyString>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("assettype = ''")
				OBJECT SET TITLE:C194(*; "oBtnFilterProductVersion"; "assettype")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterProductVersion"; "Filter assettype")
				
			: ($colDistinctAssettype[$vlUserChoice-1]="<null>")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("assettype = null")
				OBJECT SET TITLE:C194(*; "oBtnFilterAssettype"; "#"+"<null>")
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterAssettype"; "assettype=\""+"<null>"+"\"")
				
			Else 
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dCom.query("assettype = :1"; $colDistinctAssettype[$vlUserChoice-1])
				OBJECT SET TITLE:C194(*; "oBtnFilterAssettype"; "#"+$colDistinctAssettype[$vlUserChoice-1])
				OBJECT SET HELP TIP:C1181(*; "oBtnFilterAssettype"; "assettype=\""+$colDistinctAssettype[$vlUserChoice-1]+"\"")
				
		End case 
		
End case 

// - EOF -