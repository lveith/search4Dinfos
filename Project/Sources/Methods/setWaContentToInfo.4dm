//%attributes = {}
// PM: "setWaContentToInfo"

C_TEXT:C284($objNameWa; $1)

C_TEXT:C284($currUrl; $errInfoText; $docContent)
C_TEXT:C284($errUrl; $errDescription)
C_LONGINT:C283($errCode)

If (Count parameters:C259>0)
	$objNameWa:=$1
	$currUrl:=WA Get current URL:C1025(*; $objNameWa)
	// It is recommended to call 'WA GET LAST URL ERROR' within the framework of the On URL Loading Error form event to find out the cause of the error that just occurred.
	// - $errDescription (Mac OS only, under Windows, this parameter is always returned empty)
	// - $errCode (if the code is >=400, it is an error related to the HTTP protocol, otherwise, it is an error returned by the WebKit-MacOS or ActiveX-Windows)
	WA GET LAST URL ERROR:C1034(*; $objNameWa; $errUrl; $errDescription; $errCode)
	$errInfoText:="URL Loading Error #"+String:C10($errCode)+" ( "+$errDescription+" )"
	
	$docContent:=""
	$docContent:=$docContent+"<!DOCTYPE html>"
	$docContent:=$docContent+"<html>"
	$docContent:=$docContent+"<head>"
	$docContent:=$docContent+"<meta charset=\"utf-8\" />"
	$docContent:=$docContent+"<title>Site not found (#Error url cannot load)</title>"
	$docContent:=$docContent+"<meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\">"
	$docContent:=$docContent+"<meta http-equiv=\"Content-Security-Policy\" content=\"default-src 'none'; style-src 'unsafe-inline'; img-src data:; connect-src 'self'\">"
	$docContent:=$docContent+"<style type=\"text/css\" media=\"screen\">"
	$docContent:=$docContent+"body {"
	$docContent:=$docContent+"width: 100vw; height: 100vh; padding: 0; margin: 0; border: none;"
	$docContent:=$docContent+"background: rgb(246, 246, 246); background-repeat: no-repeat;"
	$docContent:=$docContent+"cursor: default; text-align: center; font-family:'-apple-system-font', 'Helvetica Neue', Helvetica, Arial, sans-serif;"
	$docContent:=$docContent+"display: -webkit-box; display: -moz-box; display: -ms-flexbox; display: -webkit-flex; display: flex;"
	$docContent:=$docContent+"-webkit-box-align: center; -moz-box-align: center; -ms-flex-align: center; -webkit-box-pack: center; -moz-box-pack: center; -ms-flex-pack: center;"
	$docContent:=$docContent+"-webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none;"
	$docContent:=$docContent+"flex-direction: column; box-sizing: border-box; align-items: center; justify-content: center;"
	$docContent:=$docContent+"}"
	$docContent:=$docContent+"h1 {"
	$docContent:=$docContent+"width: auto; margin: 0; letter-spacing: -1px;"
	$docContent:=$docContent+"line-height: 60px; font-size: 60px; font-weight: 100; text-shadow: 0 1px 0 #fff;"
	$docContent:=$docContent+"}"
	$docContent:=$docContent+"p {"
	$docContent:=$docContent+"color: rgba(0, 0, 0, 0.5); margin: 20px 0; line-height: 1.6;"
	$docContent:=$docContent+"}"
	$docContent:=$docContent+"</style>"
	$docContent:=$docContent+"</head>"
	$docContent:=$docContent+"<body>"
	$docContent:=$docContent+"<h1>"+String:C10($errCode)+"</h1>"
	$docContent:=$docContent+"<p><strong>"+$errInfoText+"</strong></p>"
	$docContent:=$docContent+"<p style=\"color: red;\">"+$errUrl+"</p>"
	$docContent:=$docContent+"</body>"
	$docContent:=$docContent+"</html>"
	
	WA SET PAGE CONTENT:C1037(*; $objNameWa; $docContent; $currUrl)
	
Else 
	
End if 

// - EOF -
