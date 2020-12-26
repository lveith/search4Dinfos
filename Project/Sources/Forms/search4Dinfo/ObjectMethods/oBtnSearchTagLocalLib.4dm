// OM: "search4Dinfo".oBtnSearchTagLocalLib

C_TEXT:C284($tag1; $tag2; $tag3)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		$tag1:="@'"+Form:C1466.searchTag1LocalLib+"'@"
		$tag2:="@'"+Form:C1466.searchTag2LocalLib+"'@"
		$tag3:="@'"+Form:C1466.searchTag3LocalLib+"'@"
		Case of 
			: ((Form:C1466.searchTag1LocalLib#"") & (Form:C1466.searchTag2LocalLib#"") & (Form:C1466.searchTag3LocalLib#""))
				Form:C1466.colLocalLib:=Form:C1466.colLocalLibALL.query("tag = :1 AND tag = :2 AND tag = :3"; $tag1; $tag2; $tag3)
				
			: ((Form:C1466.searchTag1LocalLib#"") & (Form:C1466.searchTag2LocalLib#""))
				Form:C1466.colLocalLib:=Form:C1466.colLocalLibALL.query("tag = :1 AND tag = :2"; $tag1; $tag2)
				
			: ((Form:C1466.searchTag1LocalLib#"") & (Form:C1466.searchTag3LocalLib#""))
				Form:C1466.colLocalLib:=Form:C1466.colLocalLibALL.query("tag = :1 AND tag = :2"; $tag1; $tag3)
				
			: ((Form:C1466.searchTag2LocalLib#"") & (Form:C1466.searchTag3LocalLib#""))
				Form:C1466.colLocalLib:=Form:C1466.colLocalLibALL.query("tag = :1 AND tag = :2"; $tag2; $tag3)
				
			: (Form:C1466.searchTag1LocalLib#"")
				Form:C1466.colLocalLib:=Form:C1466.colLocalLibALL.query("tag = :1"; $tag1)
				
			: (Form:C1466.searchTag2LocalLib#"")
				Form:C1466.colLocalLib:=Form:C1466.colLocalLibALL.query("tag = :1"; $tag2)
				
			: (Form:C1466.searchTag3LocalLib#"")
				Form:C1466.colLocalLib:=Form:C1466.colLocalLibALL.query("tag = :1"; $tag3)
				
			Else 
				Form:C1466.colLocalLib:=Form:C1466.colLocalLibALL
				
		End case 
		
End case 

// - EOF -