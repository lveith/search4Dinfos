//%attributes = {"preemptive":"capable"}
// PM: "getKb4dDoc"

C_LONGINT:C283($winRef;$1)
C_TEXT:C284($searchValue;$2)

C_TEXT:C284($urlKbSearch;$responseText)
C_LONGINT:C283($httpStatusCode)
C_LONGINT:C283($count;$sent;$first;$received)
C_OBJECT:C1216($obj;$objB)
C_LONGINT:C283($pos4DSID;$posQstring)

If (Count parameters:C259>0)
	$winRef:=$1
	If (Count parameters:C259>1)
		$searchValue:=$2
	End if 
End if 

If ($winRef#0)
	$colKb4dDoc:=New collection:C1472
	
	$urlKbSearch:="https://kb.4d.com/search?mode=rest&query="+$searchValue+"&type=All%20Solutions&version=All%20versions&product=All%20products&time=All&pp=&cc="
	ARRAY TEXT:C222($aHeaderNames;0)
	ARRAY TEXT:C222($aHeaderValues;0)
	$httpStatusCode:=HTTP Get:C1157($urlKbSearch;$responseText;$aHeaderNames;$aHeaderValues;*)
	
	// HTTP response status codes:
	// - Informational responses (100–199)
	// - Successful responses (200–299)
	// - Redirects (300–399)
	// - Client errors (400–499)
	// - Server errors (500–599)
	If ($httpStatusCode=200)  // 200 OK (successful HTTP requests)
		$obj:=JSON Parse:C1218($responseText)
		// SET TEXT TO PASTEBOARD(JSON Stringify($obj;*))
		$received:=0
		$count:=OB Get:C1224($obj;"__COUNT";Is longint:K8:6)
		$sent:=OB Get:C1224($obj;"__SENT";Is longint:K8:6)
		$first:=OB Get:C1224($obj;"__FIRST";Is longint:K8:6)
		$received:=$received+$sent
		$colKb4dDoc:=OB Get:C1224($obj;"__ASSETS";Is collection:K8:32)
		CALL FORM:C1391($winRef;"kb4dDocReceiveInForm";$colKb4dDoc)
	Else 
		$received:=0
		$count:=0
		$sent:=0
		$first:=0
	End if 
	
	$pos4DSID:=Find in array:C230($aHeaderValues;"4DSID=@")
	$posQstring:=Find in array:C230($aHeaderValues;"qstring=@")
	If ($pos4DSID>0)
		$txt4DSID:=Split string:C1554($aHeaderValues{$pos4DSID};";")[0]+"; "
	End if 
	If ($posQstring>0)
		$txtQstring:=Split string:C1554($aHeaderValues{$posQstring};";")[0]
	End if 
	
	// Request
	// GET /search HTTP/1.1
	// Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
	// Pragma: no-cache
	// Cookie: 4DSID=FADEFDC03CB7F64383A67ADD40AE16E7; qstring=C_BLOB|All Solutions|All products|All|All versions|desc|date|pnext|21|20
	// Cache-Control: no-cache
	// Host: kb.4d.com
	// User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15
	// Accept-Language: de-de
	// Accept-Encoding: gzip, deflate, br
	// Connection: keep-alive
	// -----
	// Accept-Ranges: bytes
	// Connection: keep-alive
	// Content-Length: 4876
	// Content-Type: application/json; charset=UTF-8
	// Date: Mon, 21 Dec 2020 03:46:01 GMT
	// Expires: Mon, 21 Dec 2020 03:46:01 GMT
	// Server: 4D/18.4.0
	// Set-Cookie: 4DSID=7DAE771DBEA40C43AE78B2ABE8028332; Path=/; Max-Age=12000; HttpOnly; Version=1
	// SET-COOKIE: qstring=C_TEXT|All Solutions|All products|All|All versions|desc|date|none|1|20; domain=kb.4d.com;
	
	If (True:C214)
		While (($httpStatusCode=200) & ($received<$count))
			$urlKbSearch:="https://kb.4d.com/search?mode=rest&nav=pnext&pos=0"
			ARRAY TEXT:C222($aHeaderNames;0)
			ARRAY TEXT:C222($aHeaderValues;0)
			APPEND TO ARRAY:C911($aHeaderNames;"Accept")
			APPEND TO ARRAY:C911($aHeaderValues;"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
			APPEND TO ARRAY:C911($aHeaderNames;"Pragma")
			APPEND TO ARRAY:C911($aHeaderValues;"no-cache")
			If (($pos4DSID>0) & ($posQstring>0))
				APPEND TO ARRAY:C911($aHeaderNames;"Cookie")
				APPEND TO ARRAY:C911($aHeaderValues;$txt4DSID+$txtQstring)
			End if 
			APPEND TO ARRAY:C911($aHeaderNames;"Cache-Control")
			APPEND TO ARRAY:C911($aHeaderValues;"no-cache")
			APPEND TO ARRAY:C911($aHeaderNames;"Host")
			APPEND TO ARRAY:C911($aHeaderValues;"kb.4d.com")
			APPEND TO ARRAY:C911($aHeaderNames;"Accept-Encoding")
			APPEND TO ARRAY:C911($aHeaderValues;"gzip, deflate, br")
			APPEND TO ARRAY:C911($aHeaderNames;"Connection")
			APPEND TO ARRAY:C911($aHeaderValues;"keep-alive")
			$httpStatusCode:=HTTP Get:C1157($urlKbSearch;$responseText;$aHeaderNames;$aHeaderValues;*)
			If ($httpStatusCode=200)  // 200 OK (successful HTTP requests)
				If ($responseText="{@")
					$objB:=JSON Parse:C1218($responseText)
					$received:=$received+OB Get:C1224($objB;"__SENT";Is longint:K8:6)
					$colKb4dDoc:=OB Get:C1224($objB;"__ASSETS";Is collection:K8:32)
					CALL FORM:C1391($winRef;"kb4dDocReceiveInForm";$colKb4dDoc)
				Else 
					$httpStatusCode:=400  // 400 Bad Request (The server cannot or will not process the request due to an apparent client error (e.g., malformed request syntax, size too large, invalid request message framing, or deceptive request routing))
				End if 
			End if 
		End while 
	End if 
	
End if 

/* ========== Data-example-responseText ==========

{
  "__SITE": "https://kb.4d.com",
  "__COUNT": 723,
  "__SENT": 20,
  "__FIRST": 1,
  "__ACCESS": 0,
  "__ASSETS": [
    {
      "recnum": 1,
      "assetid": 78601,
      "title": "Utility Method to Get Web Area's Web Rendering Engine",
      "publishedDate": "December 15, 2020",
      "assettype": "Tech Tip",
      "productName": "4D",
      "productVersion": "18",
      "partnerOnly": false,
      "favorite": false,
      "isnew": true
    },
    {
      "recnum": 2,
      "assetid": 78570,
      "title": "Replacement Method for AP Add Table and Fields",
      "publishedDate": "October 26, 2020",
      "assettype": "Tech Tip",
      "productName": "4D",
      "productVersion": "18",
      "partnerOnly": false,
      "favorite": false,
      "isnew": false
    }
  ]
}

===============================================*/

// - EOF -