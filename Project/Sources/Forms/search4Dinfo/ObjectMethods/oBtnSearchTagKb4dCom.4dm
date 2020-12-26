// OM: "search4Dinfo".oBtnSearchTagKb4dCom

C_TEXT:C284($tag1; $tag2; $tag3)
C_LONGINT:C283($count)
C_TEXT:C284($logOp)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		$logOp:="AND"
		$count:=Num:C11(Form:C1466.searchTag1Kb4dCom#"")+Num:C11(Form:C1466.searchTag2Kb4dCom#"")+Num:C11(Form:C1466.searchTag3Kb4dCom#"")
		
		If ($count>1)
			C_TEXT:C284($vtItems)
			C_LONGINT:C283($vlUserChoice)
			ARRAY TEXT:C222($arTypes; 2)
			
			If ($count=2)
				$arTypes{1}:="word AND word"
				$arTypes{2}:="word OR word"
			Else 
				$arTypes{1}:="word AND word AND word"
				$arTypes{2}:="word OR word OR word"
			End if 
			
			
			For ($i; 1; Size of array:C274($arTypes))
				$vtItems:=$vtItems+$arTypes{$i}+";"
			End for 
			$vlUserChoice:=Pop up menu:C542($vtItems)
			
			If ($vlUserChoice=2)
				$logOp:="OR"
			End if 
			
		End if 
		
		$tag1:="@"+Form:C1466.searchTag1Kb4dCom+"@"
		$tag2:="@"+Form:C1466.searchTag2Kb4dCom+"@"
		$tag3:="@"+Form:C1466.searchTag3Kb4dCom+"@"
		Case of 
			: ((Form:C1466.searchTag1Kb4dCom#"") & (Form:C1466.searchTag2Kb4dCom#"") & (Form:C1466.searchTag3Kb4dCom#""))
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dComALL.query("title = :1 "+$logOp+" title = :2 "+$logOp+" title = :3"; $tag1; $tag2; $tag3)
				
			: ((Form:C1466.searchTag1Kb4dCom#"") & (Form:C1466.searchTag2Kb4dCom#""))
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dComALL.query("title = :1 "+$logOp+" title = :2"; $tag1; $tag2)
				
			: ((Form:C1466.searchTag1Kb4dCom#"") & (Form:C1466.searchTag3Kb4dCom#""))
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dComALL.query("title = :1 "+$logOp+" title = :2"; $tag1; $tag3)
				
			: ((Form:C1466.searchTag2Kb4dCom#"") & (Form:C1466.searchTag3Kb4dCom#""))
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dComALL.query("title = :1 "+$logOp+" title = :2"; $tag2; $tag3)
				
			: (Form:C1466.searchTag1Kb4dCom#"")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dComALL.query("title = :1"; $tag1)
				
			: (Form:C1466.searchTag2Kb4dCom#"")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dComALL.query("title = :1"; $tag2)
				
			: (Form:C1466.searchTag3Kb4dCom#"")
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dComALL.query("title = :1"; $tag3)
				
			Else 
				Form:C1466.colKb4dCom:=Form:C1466.colKb4dComALL
				
		End case 
		
		clearKb4dFilters
		
End case 

// - EOF -