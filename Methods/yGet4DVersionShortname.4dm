//%attributes = {}
  // PM: "yGet4DVersionShortname"

C_TEXT:C284($txtResult;$0)
C_LONGINT:C283($buildNr4D)
C_TEXT:C284($major4D;$minor4D;$release4D;$version4D)

$version4D:=Application version:C493($buildNr4D)
$major4D:=$version4D[[1]]+$version4D[[2]]  //version number, e.g. 14
$release4D:=$version4D[[3]]  //Rx
$minor4D:=$version4D[[4]]  //.x
$txtResult:="4Dv"+$major4D
If ($release4D="0")  //4D v14.x
	$txtResult:=$txtResult+Choose:C955($minor4D#"0";"."+$minor4D;"")
Else   //4D v14 Rx
	$txtResult:=$txtResult+"R"+$release4D
End if 
$txtResult:=$txtResult+"b"+String:C10($buildNr4D)

$0:=$txtResult

  // - EOF -