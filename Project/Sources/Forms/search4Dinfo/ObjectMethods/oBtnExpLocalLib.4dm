// OM: "search4Dinfo".oBtnExpLocalLib

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		If (True:C214)
			C_OBJECT:C1216($obj)
			Form:C1466.colLocalLib:=New collection:C1472
			
			$obj:=New object:C1471
			$obj.key:="4dCom_US"
			$obj.url:="https://us.4d.com"
			$obj.cmt:="4D homepage (United States, Startpage)"
			$obj.tag:="'4d' 'homepage' 'united-states' 'us' 'usa' 'startpage'"
			Form:C1466.colLocalLib.push($obj)
			
			$obj:=New object:C1471
			$obj.key:="4dCom_FR"
			$obj.url:="https://fr.4d.com"
			$obj.cmt:="4D homepage (France, Startpage)"
			$obj.tag:="'4d' 'homepage' 'france' 'fr' 'startpage'"
			Form:C1466.colLocalLib.push($obj)
			
			$obj:=New object:C1471
			$obj.key:="4dCom_DE"
			$obj.url:="https://de.4d.com"
			$obj.cmt:="4D homepage (Deutschland, Startpage)"
			$obj.tag:="'4d' 'homepage' 'deutschland' 'de' 'german' 'startpage'"
			Form:C1466.colLocalLib.push($obj)
			
			$obj:=New object:C1471
			$obj.key:="k2"
			$obj.cmt:="cmt-k2"
			$obj.tag:="'test2'"
			Form:C1466.colLocalLib.push($obj)
			
			$obj:=New object:C1471
			$obj.key:="k3"
			$obj.cmt:="cmt-k3"
			$obj.tag:="'test3'"
			Form:C1466.colLocalLib.push($obj)
			
			Form:C1466.colLocalLibALL:=Form:C1466.colLocalLib
			
		End if 
		
		C_BLOB:C604($blob)
		C_BOOLEAN:C305($ok)
		C_TEXT:C284($appName; $timeStamp)
		C_TEXT:C284($versArchivFolder)
		C_COLLECTION:C1488($tmpColVar)
		
		Case of 
			: (Form event code:C388=On Clicked:K2:4)
				
				C_TEXT:C284($vtItems)
				C_LONGINT:C283($vlUserChoice)
				ARRAY TEXT:C222($arTypes; 2)
				$arTypes{1}:="ALL"
				$arTypes{2}:="Current Selection"
				
				For ($i; 1; Size of array:C274($arTypes))
					$vtItems:=$vtItems+$arTypes{$i}+";"
				End for 
				$vlUserChoice:=Pop up menu:C542($vtItems)
				
				$ok:=False:C215
				SET BLOB SIZE:C606($blob; 0)
				Case of 
					: ($vlUserChoice=1)  // "ALL"
						Case of 
							: (Form:C1466.colLocalLib=Null:C1517)
								Form:C1466.colLocalLib:=New collection:C1472
								BEEP:C151
							: (Form:C1466.colLocalLib.length<1)
								BEEP:C151
							Else 
								$tmpColVar:=Form:C1466.colLocalLib.copy()
								VARIABLE TO BLOB:C532($tmpColVar; $blob)
								$ok:=True:C214
						End case 
						
					: ($vlUserChoice=2)  // "Current Selection"
						Case of 
							: (Form:C1466.localLibCurrSel=Null:C1517)
								Form:C1466.localLibCurrSel:=New collection:C1472
								BEEP:C151
							: (Form:C1466.localLibCurrSel.length<1)
								BEEP:C151
							Else 
								$tmpColVar:=Form:C1466.localLibCurrSel.copy()
								VARIABLE TO BLOB:C532($tmpColVar; $blob)  // cmd needs a var, not "Form."
								$ok:=True:C214
						End case 
						
					Else 
						BEEP:C151
				End case 
				
				If (($ok) & (BLOB size:C605($blob)>0))
					
					If (False:C215)  // just debug helper
						// 0 = BLOB is not compressed, 1 = Compact compression, 2 = Fast compression, -1 = GZIP Best compression, -2 = GZIP Fast compression
						C_LONGINT:C283($compressStatus; $expandedSize; $currentSize)
						BLOB PROPERTIES:C536($blob; $compressStatus; $expandedSize; $currentSize)
					End if 
					
					COMPRESS BLOB:C534($blob)
					
					If (False:C215)  // just debug helper
						BLOB PROPERTIES:C536($blob; $compressStatus; $expandedSize; $currentSize)
					End if 
					
					C_LONGINT:C283($buildNr4D)
					C_TEXT:C284($info4D; $major4D; $minor4D; $release4D; $version4D)
					$version4D:=Application version:C493($buildNr4D)
					$major4D:=$version4D[[1]]+$version4D[[2]]  //version number, e.g. 14
					$release4D:=$version4D[[3]]  //Rx
					$minor4D:=$version4D[[4]]  //.x
					$info4D:="4Dv"+$major4D
					If ($release4D="0")  //4D v14.x
						$info4D:=$info4D+Choose:C955($minor4D#"0"; "."+$minor4D; "")
					Else   //4D v14 Rx
						$info4D:=$info4D+"R"+$release4D
					End if 
					$info4D:=$info4D+"b"+String:C10($buildNr4D)
					If (Version type:C495 ?? 64 bit version:K5:25)
						$info4D:=$info4D+"(64bit)"
					Else 
						$info4D:=$info4D+"(32bit)"
					End if 
					
					$appName:=Request:C163("Enter a name")  // Example: "LocalInfoLibV1"
					If (OK=1)
						
						$timeStamp:=String:C10(Year of:C25(Current date:C33); "0000")+String:C10(Month of:C24(Current date:C33); "00")+String:C10(Day of:C23(Current date:C33); "00")+"T"+Replace string:C233(String:C10(Current time:C178; System time short:K7:9); ":"; "")
						
						$versArchivFolder:=Get 4D folder:C485(Current resources folder:K5:16)
						$versArchivFolder:=$versArchivFolder+"localInfoLibsArchiveDTA"+$versArchivFolder[[Length:C16($versArchivFolder)]]
						
						$doc:=Create document:C266($versArchivFolder+$appName+"_"+$timeStamp+"_"+$info4D+".DTA")  //If the document has been created correctly, the system variable OK is set to 1 and the system variable Document contains the full pathname and the name of document
						If (OK=1)  // If a document has been created
							CLOSE DOCUMENT:C267($doc)  // We don't need to keep it open
							BLOB TO DOCUMENT:C526(Document; $blob)
							If (OK=0)
								BEEP:C151  // Handle error
							End if 
						Else 
							BEEP:C151
						End if 
						
					Else 
						BEEP:C151
					End if 
					
				Else 
					BEEP:C151
				End if 
				
		End case 
		
End case 

// - EOF -