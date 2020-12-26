// OM: "search4Dinfo".oBtnImpLocalLib

C_BLOB:C604($blob)
C_BOOLEAN:C305($ok)
C_LONGINT:C283($i)
C_COLLECTION:C1488($tmpCol)
C_LONGINT:C283($compressStatus; $expandedSize; $currentSize)

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		C_TEXT:C284($vtItems)
		C_LONGINT:C283($vlUserChoice)
		ARRAY TEXT:C222($arTypes; 0)
		C_TEXT:C284($versArchivFolder)
		$versArchivFolder:=Get 4D folder:C485(Current resources folder:K5:16)
		$versArchivFolder:=$versArchivFolder+"localInfoLibsArchiveDTA"+$versArchivFolder[[Length:C16($versArchivFolder)]]
		DOCUMENT LIST:C474($versArchivFolder; $arTypes; Recursive parsing:K24:13+Absolute path:K24:14+Ignore invisible:K24:16)
		SORT ARRAY:C229($arTypes; >)
		
		For ($i; 1; Size of array:C274($arTypes))
			$vtItems:=$vtItems+Char:C90(1)+Replace string:C233($arTypes{$i}; $versArchivFolder; "")+";"
		End for 
		$vlUserChoice:=Pop up menu:C542($vtItems)
		
		$ok:=False:C215
		SET BLOB SIZE:C606($blob; 0)
		
		If (($vlUserChoice>0) & ($vlUserChoice<=Size of array:C274($arTypes)))
			If (Shift down:C543)
				C_TEXT:C284($tmpFileName)
				$tmpFileName:=Select document:C905($versArchivFolder; ".dta"; "Select the dta file"; Alias selection:K24:10+Package open:K24:8+Use sheet window:K24:11)
				$arTypes{$vlUserChoice}:=Document
				If (OK=1)
					$doc:=Open document:C264($arTypes{$vlUserChoice})
				End if 
			Else 
				$doc:=Open document:C264($arTypes{$vlUserChoice})
			End if 
			If (OK=1)  // If a document has been chosen
				CLOSE DOCUMENT:C267($doc)  // We don't need to keep it open
				DOCUMENT TO BLOB:C525(Document; $blob)  // Load the document
				If (OK=1)
					// 0 = BLOB is not compressed, 1 = Compact compression, 2 = Fast compression, -1 = GZIP Best compression, -2 = GZIP Fast compression
					BLOB PROPERTIES:C536($blob; $compressStatus; $expandedSize; $currentSize)
					If ($compressStatus#Is not compressed:K22:11)
						EXPAND BLOB:C535($blob)
					End if 
					$tmpCol:=New collection:C1472
					BLOB TO VARIABLE:C533($blob; $tmpCol)
					Form:C1466.colLocalLib:=$tmpCol
					Form:C1466.colLocalLibALL:=Form:C1466.colLocalLib
				Else 
					BEEP:C151
				End if 
			End if 
		Else 
			BEEP:C151
		End if 
		
End case 

// - EOF -