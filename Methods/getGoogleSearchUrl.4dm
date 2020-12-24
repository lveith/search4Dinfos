//%attributes = {}
// PM: "getGoogleSearchUrl"

C_TEXT:C284($googleSearchUrl;$0)
C_TEXT:C284($opOR)

//WA OPEN URL(*;"oWaGoogle";"https://www.google.com/search?q=site%3Adoc.4d.com%2F4Dv18R5+OR+site%3Akb.4d.com+OR+site%3Adeveloper.4d.com+OR+site%3Ablog.4d.com+%22C_TEXT%22&num=100")

$googleSearchUrl:="https://www.google.com/search?q="

$opOR:=""

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

// --------

If (Form:C1466.searchTitleGoogle#"")
	If ($opOR#"")
		$opOR:="+"
	End if 
	$googleSearchUrl:=$googleSearchUrl+$opOR+"intitle%3A"+Replace string:C233(Form:C1466.searchTitleGoogle;" ";"%20")
End if 

If (Form:C1466.searchValueGoogle#"")
	If ($opOR#"")
		$opOR:="+"
	End if 
	$googleSearchUrl:=$googleSearchUrl+$opOR+"%22"+Replace string:C233(Form:C1466.searchValueGoogle;" ";"%20")+"%22"
End if 

$googleSearchUrl:=$googleSearchUrl+"&num=100"

$0:=$googleSearchUrl