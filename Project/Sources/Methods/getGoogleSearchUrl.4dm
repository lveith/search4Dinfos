//%attributes = {}
// PM: "getGoogleSearchUrl"

C_TEXT:C284($googleSearchUrl; $0)
C_TEXT:C284($kind; $1)  // optional default="" | "all" | "video"
C_TEXT:C284($kindReduce; $2)  // optional default="" | "4D Software" | "4D Deutschland" | "ignoreSite4DCom"

C_TEXT:C284($opOR)

If (Count parameters:C259>0)
	$kind:=$1
	If ($kind#"video")
		$kind:=""
	End if 
	If (Count parameters:C259>1)
		$kindReduce:=$2
	End if 
End if 

//WA OPEN URL(*;"oWaGoogle";"https://www.google.com/search?q=site%3Adoc.4d.com%2F4Dv18R5+OR+site%3Akb.4d.com+OR+site%3Adeveloper.4d.com+OR+site%3Ablog.4d.com+%22C_TEXT%22&num=100")

$googleSearchUrl:="https://www.google.com/search?q="

$opOR:=""

If ($kindReduce="")
	
	If (Form:C1466.cb4dCom>0)
		$googleSearchUrl:=$googleSearchUrl+$opOR+"site%3A"+Form:C1466.cbt4dCom
		$opOR:="+OR+"
	End if 
	
	If (Form:C1466.cbDoc4dCom>0)
		$googleSearchUrl:=$googleSearchUrl+$opOR+"site%3A"+Form:C1466.cbtDoc4dCom
		$opOR:="+OR+"
	End if 
	
	If (Form:C1466.cbDoc4dComV18R5>0)
		$googleSearchUrl:=$googleSearchUrl+$opOR+"site%3A"+Form:C1466.cbtDoc4dComV18R5
		$opOR:="+OR+"
	End if 
	
	If (Form:C1466.cbKb4dCom>0)
		$googleSearchUrl:=$googleSearchUrl+$opOR+"site%3A"+Form:C1466.cbtKb4dCom
		$opOR:="+OR+"
	End if 
	
	If (Form:C1466.cbDev4dCom>0)
		$googleSearchUrl:=$googleSearchUrl+$opOR+"site%3A"+Form:C1466.cbtDev4dCom
		$opOR:="+OR+"
	End if 
	
	If (Form:C1466.cbBlog4dCom>0)
		$googleSearchUrl:=$googleSearchUrl+$opOR+"site%3A"+Form:C1466.cbtBlog4dCom
		$opOR:="+OR+"
	End if 
	
	If (Form:C1466.cbEvents4dCom>0)
		$googleSearchUrl:=$googleSearchUrl+$opOR+"site%3A"+Form:C1466.cbtEvents4dCom
		$opOR:="+OR+"
	End if 
	
End if 

// --------

If (Form:C1466.searchTitleGoogle#"")
	If ($opOR#"")
		$opOR:="+"
	End if 
	$googleSearchUrl:=$googleSearchUrl+$opOR+"intitle%3A"+Replace string:C233(Form:C1466.searchTitleGoogle; " "; "%20")
End if 

If (Form:C1466.searchValueGoogle#"")
	If ($opOR#"")
		$opOR:="+"
	End if 
	$googleSearchUrl:=$googleSearchUrl+$opOR+"%22"+Replace string:C233(Form:C1466.searchValueGoogle; " "; "%20")+"%22"
End if 

If ($kind="video")
	If (($kindReduce#"") & ($kindReduce#"ignoreSite4DCom"))
		If (Form:C1466.searchValueGoogle#"")
			$opOR:="+AND+"
		End if 
		$googleSearchUrl:=$googleSearchUrl+$opOR+"%22"+Replace string:C233($kindReduce; " "; "%20")+"%22"
	Else 
		If (Form:C1466.searchValueGoogle#"")
			$opOR:="+AND+"
		End if 
		$googleSearchUrl:=$googleSearchUrl+$opOR+"%22"+Replace string:C233("4D Software"; " "; "%20")+"%22"
	End if 
	$googleSearchUrl:=$googleSearchUrl+" -maxon -cinema -Acoustic -Microscopy -Orthodontic -autodesk -Imagix -Ultraschall -CostX -Bertuah -capterra -constructionweekonline"
	$googleSearchUrl:=$googleSearchUrl+"&tbm=vid"
End if 

$googleSearchUrl:=$googleSearchUrl+"&num=100"

$0:=$googleSearchUrl