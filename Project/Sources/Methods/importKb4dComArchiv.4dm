//%attributes = {}
// PM: "importKb4dComArchiv"

C_TEXT:C284($archivName; $1)  // optional (e.g. "ALL_Results5958_20201226T1136_4Dv18R5b259387(64bit)")

C_BLOB:C604($blob)
C_BOOLEAN:C305($ok)
C_LONGINT:C283($i)
C_COLLECTION:C1488($tmpCol)
C_LONGINT:C283($compressStatus; $expandedSize; $currentSize)
C_TEXT:C284($vtItems)
C_LONGINT:C283($vlUserChoice)
C_TEXT:C284($versArchivFolder)

If (Count parameters:C259>0)
	$archivName:=$1
End if 

ARRAY TEXT:C222($arPaths; 0)

$versArchivFolder:=Get 4D folder:C485(Current resources folder:K5:16)
$versArchivFolder:=$versArchivFolder+"localKb4dArchiveDTA"+$versArchivFolder[[Length:C16($versArchivFolder)]]
DOCUMENT LIST:C474($versArchivFolder; $arPaths; Recursive parsing:K24:13+Absolute path:K24:14+Ignore invisible:K24:16)
SORT ARRAY:C229($arPaths; >)

If ($archivName#"")
	$vlUserChoice:=Find in array:C230($arPaths; $versArchivFolder+$archivName)
	
Else 
	For ($i; 1; Size of array:C274($arPaths))
		$vtItems:=$vtItems+Char:C90(1)+Replace string:C233($arPaths{$i}; $versArchivFolder; "")+";"
	End for 
	$vlUserChoice:=Pop up menu:C542($vtItems)
	
End if 

$ok:=False:C215
SET BLOB SIZE:C606($blob; 0)

If (($vlUserChoice>0) & ($vlUserChoice<=Size of array:C274($arPaths)))
	If ((Shift down:C543) & ($archivName#""))
		C_TEXT:C284($tmpFileName)
		$tmpFileName:=Select document:C905($versArchivFolder; ".dta"; "Select the dta file"; Alias selection:K24:10+Package open:K24:8+Use sheet window:K24:11)
		$arPaths{$vlUserChoice}:=Document
		If (OK=1)
			$doc:=Open document:C264($arPaths{$vlUserChoice})
		End if 
	Else 
		$doc:=Open document:C264($arPaths{$vlUserChoice})
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
			Form:C1466.colKb4dCom:=$tmpCol
			Form:C1466.colKb4dComALL:=Form:C1466.colKb4dCom
		Else 
			BEEP:C151
		End if 
	End if 
Else 
	BEEP:C151
End if 

// - EOF -